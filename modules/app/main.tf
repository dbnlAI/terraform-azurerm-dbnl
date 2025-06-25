locals {
  oidc_enabled  = var.oidc_issuer != null && var.oidc_audience != null && var.oidc_client_id != null && var.oidc_scopes != null
  admin_enabled = nonsensitive(var.admin_password != null)

  flower_basic_auth_enabled = nonsensitive(var.flower_basic_auth_username != null && var.flower_basic_auth_password != null)

  lb_annotations = {
    "kubernetes.io/ingress.class" : "azure/application-gateway"
    "cert-manager.io/cluster-issuer" : var.cert_manager_cluster_issuer
    "cert-manager.io/acme-challenge-type" : var.cert_manager_acme_challenge_type
    "appgw.ingress.kubernetes.io/ssl-redirect" : "true"
    "appgw.ingress.kubernetes.io/use-private-ip" : var.public_facing ? "false" : "true"
  }
}

# Create image pull secrets to pull containers from registry.
resource "kubernetes_secret" "image_pull_secret" {
  metadata {
    name = "${var.prefix}-docker-cfg"
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.registry_server}" = {
          "username" = var.registry_username
          "password" = var.registry_password
          "auth"     = base64encode("${var.registry_username}:${var.registry_password}")
        }
      }
    })
  }
}

locals {
  values = {
    imagePullSecrets = [
      {
        name = kubernetes_secret.image_pull_secret.metadata[0].name
      }
    ]
    api = {
      serviceAccount = {
        annotations = {
          "azure.workload.identity/client-id" : var.service_identities["api-srv"].client_id
          "azure.workload.identity/tenant-id" : var.service_identities["api-srv"].tenant_id
        }
      }
      podLabels = {
        "azure.workload.identity/use" : "true"
      }
      image = {
        repository = "${var.registry_server}/images/api-srv"
      }
    }
    auth = {
      admin = {
        enabled = local.admin_enabled
      }
      devToken = {
        issuer   = "https://${var.domain}"
        audience = "https://${var.domain}"
      }
      oidc = {
        enabled  = local.oidc_enabled
        issuer   = var.oidc_issuer
        audience = var.oidc_audience
        clientId = var.oidc_client_id
        scopes   = var.oidc_scopes
      }
    }
    db = {
      host     = var.db_host
      port     = var.db_port
      database = var.db_database
    }
    redis = {
      host     = var.redis_host
      port     = var.redis_port
      database = var.redis_database
      tls = {
        enabled = true
      }
    }
    ingress = {
      enabled = true
      api = {
        annotations = local.lb_annotations
        basePath    = "/api"
        host        = var.domain
        tls = {
          enabled = true
          secret  = "${var.prefix}-tls-secret"
        }
      }
      ui = {
        annotations = local.lb_annotations
        host        = var.domain
        tls = {
          enabled = true
          secret  = "${var.prefix}-tls-secret"
        }
      }
    }
    migration = {
      serviceAccount = {
        annotations = {
          "azure.workload.identity/client-id" : var.service_identities["migration-job"].client_id
          "azure.workload.identity/tenant-id" : var.service_identities["migration-job"].tenant_id
        }
      }
      podLabels = {
        "azure.workload.identity/use" : "true"
      }
      image = {
        repository = "${var.registry_server}/images/migration-job"
      }
    }
    ui = {
      serviceAccount = {
        annotations = {
          "azure.workload.identity/client-id" : var.service_identities["ui-srv"].client_id
          "azure.workload.identity/tenant-id" : var.service_identities["ui-srv"].tenant_id
        }
      }
      podLabels = {
        "azure.workload.identity/use" : "true"
      }
      image = {
        repository = "${var.registry_server}/images/ui-srv"
      }
    }
    worker = {
      realtime = {
        enabled = true
      }
      podLabels = {
        "azure.workload.identity/use" : "true"
      }
      serviceAccount = {
        annotations = {
          "azure.workload.identity/client-id" : var.service_identities["worker-srv"].client_id
          "azure.workload.identity/tenant-id" : var.service_identities["worker-srv"].tenant_id
        }
      }
      image = {
        repository = "${var.registry_server}/images/worker-srv"
      }
    }
    flower = var.flower_enabled ? {
      enabled = true
      serviceAccount = {
        annotations = {
          "azure.workload.identity/client-id" : var.service_identities["flower-srv"].client_id
          "azure.workload.identity/tenant-id" : var.service_identities["flower-srv"].tenant_id
        }
      }
      podLabels = {
        "azure.workload.identity/use" : "true"
      }
      port = 5555
      basicAuth = {
        enabled = local.flower_basic_auth_enabled
      }
      image = {
        repository = "${var.registry_server}/images/flower-srv"
      }
      } : {
      enabled        = false
      serviceAccount = {}
      podLabels      = {}
      basicAuth = {
        enabled = false
      }
      port = 0
      image = {
        repository = "${var.registry_server}/images/flower-srv"
      }
    }
    storage = {
      abs = {
        enabled            = true
        storageAccountName = var.abs_storage_account_name
        container          = var.abs_container
      }
    }
  }
}

# Create Helm release.
resource "helm_release" "dbnl" {
  name       = var.helm_release_name
  repository = "oci://${var.registry_server}/charts"
  chart      = "dbnl"
  version    = var.helm_chart_version
  namespace  = var.helm_release_namespace

  repository_username = var.registry_username
  repository_password = var.registry_password

  values = [yamlencode(local.values)]

  dynamic "set_sensitive" {
    for_each = local.admin_enabled ? ["admin-enabled"] : []
    content {
      name  = "auth.admin.hashedPassword"
      value = bcrypt(var.admin_password)
    }
  }

  set_sensitive {
    name  = "auth.devToken.privateKey"
    value = var.dev_token_private_key
  }

  set_sensitive {
    name  = "redis.username"
    value = var.redis_username
  }

  set_sensitive {
    name  = "redis.password"
    value = var.redis_password
  }

  set_sensitive {
    name  = "db.username"
    value = var.db_username
  }

  set_sensitive {
    name  = "db.password"
    value = var.db_password
  }

  dynamic "set_sensitive" {
    for_each = local.flower_basic_auth_enabled ? ["flower-basic-auth-password"] : []
    content {
      name  = "flower.basicAuth.password"
      value = var.flower_basic_auth_password
    }
  }

  dynamic "set_sensitive" {
    for_each = local.flower_basic_auth_enabled ? ["flower-basic-auth-username"] : []
    content {
      name  = "flower.basicAuth.username"
      value = var.flower_basic_auth_username
    }
  }

  lifecycle {
    precondition {
      condition     = local.admin_enabled != local.oidc_enabled
      error_message = "One and only one of oidc or admin should be set."
    }
  }

  depends_on = [
    kubernetes_secret.image_pull_secret
  ]
}

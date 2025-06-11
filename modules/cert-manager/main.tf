resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true

  set {
    name  = "crds.enabled"
    value = "true"
  }
}

resource "helm_release" "cluster_issuer" {
  name      = "cluster-issuer"
  chart     = "${path.module}/charts/cluster-issuer"
  namespace = "cert-manager"

  set {
    name  = "email"
    value = var.acme_email
  }

  set {
    name  = "server"
    value = var.acme_server
  }

  set {
    name  = "privateKeySecretRef"
    value = var.acme_private_key_secret
  }

  depends_on = [helm_release.cert_manager]
}
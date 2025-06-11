Bundles cert-manager cluster issuer as a Helm chart. 

This makes it possible to issue certificate in the same Terraform apply command used to deploy the AKS cluster which is
not possible when using `kubernetes_manifest``.

See https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest#before-you-use-this-resource.

The content of the chart is based on the Azure certificate issuance with LetsEncrypt.org instructions.

See https://azure.github.io/application-gateway-kubernetes-ingress/how-tos/lets-encrypt/.
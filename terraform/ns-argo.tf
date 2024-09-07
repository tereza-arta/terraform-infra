resource "kubectl_manifest" "namespace_argo" {
  yaml_body = <<YAML

apiVersion: v1
kind: Namespace
metadata:
  name: argocd

YAML

  depends_on = [helm_release.metallb]
}

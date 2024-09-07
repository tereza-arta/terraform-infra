resource "kubectl_manifest" "namespace_mlb" {
  yaml_body = <<YAML

apiVersion: v1
kind: Namespace
metadata:
  name: metallb-system

YAML

  depends_on = [null_resource.install_ingress]
}

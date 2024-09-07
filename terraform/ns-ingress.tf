resource "kubectl_manifest" "namespace_ing" {
  yaml_body = <<YAML

apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx

YAML
}

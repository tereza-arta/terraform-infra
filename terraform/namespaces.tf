resource "kubectl_manifest" "namespace_ing" {
  yaml_body = <<YAML

apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx

YAML
}

resource "kubectl_manifest" "namespace_mlb" {
  yaml_body = <<YAML

apiVersion: v1
kind: Namespace
metadata:
  name: metallb-system

YAML

  depends_on = [null_resource.install_ingress]
}

resource "kubectl_manifest" "namespace_argo" {
  yaml_body = <<YAML

apiVersion: v1
kind: Namespace
metadata:
  name: argocd

YAML

  depends_on = [helm_release.metallb]
}

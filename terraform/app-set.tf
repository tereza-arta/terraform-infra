resource "kubectl_manifest" "app_set" {
  yaml_body = <<YAML

apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: git-generator
  namespace: argocd
spec:
  generators:
  - git:
      repoURL: https://github.com/tereza-arta/argo-apps.git
      revision: main
      directories:
      - path: gen/res/apps/*
  template:
    metadata:
      name: '{{path.basename}}-application'
    spec:
      project: default
      source:
        repoURL: https://github.com/tereza-arta/argo-apps.git
        targetRevision: main
        path: '{{path}}'
      destination:
        server: https://kubernetes.default.svc
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
          allowEmpty: false

YAML

  depends_on = [null_resource.install_app_set_crd]
}

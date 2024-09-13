resource "helm_release" "metallb" {
  name       = var.mlb_release_name
  repository = var.mlb_repository
  chart      = var.mlb_chart
  namespace  = var.mlb_namespace

  depends_on = [kubectl_manifest.namespace_mlb]
}

resource "helm_release" "argocd" {
  name             = var.release_name
  repository       = var.repository
  chart            = var.chart
  namespace        = var.namespace
  #create_namespace = var.create_ns
  version          = var.chart_version

  values = ["${file("values.yaml")}"]

  depends_on = [
    kubectl_manifest.namespace_argo
  ]
}
    
resource "null_resource" "install_ingress" {
  provisioner "local-exec" {
    command = <<EOT
      helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx;
      helm repo update;
      helm install ingress-release ingress-nginx/ingress-nginx --version 4.11.2 -n ingress-nginx
    EOT
  }

  depends_on = [kubectl_manifest.namespace_ing]
}

resource "null_resource" "install_app_set_crd" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/applicationset/v0.1.0/manifests/install.yaml
    EOT
  }

  depends_on = [helm_release.argocd]
}

#resource "helm_release" "ingress-svc" {
#  name = "ingress"
#  repository = "https://kubernetes.github.io/ingress-nginx"
#  chart = "ingress-nginx"
#  namespace = "ingress-nginx"
#  #create_namespace = true
#  #version = "4.11.2"
#
#  depends_on = [kubectl_manifest.namespace_ing]
#}

#resource "null_resource" "install_updater" {
#  provisioner "local-exec" {
#    command = <<EOT
#      helm repo add argo https://argoproj.github.io/argo-helm;
#      helm repo update;
#      helm install updater argo/argocd-image-updater --version 0.11.0 -n argocd
#    EOT
#  }
#
#  depends_on = [helm_release.argocd]
#}

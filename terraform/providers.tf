terraform {
  required_providers {
    kubectl = {
      #source  = "gavinbunney/kubectl"
      source  = "alekc/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

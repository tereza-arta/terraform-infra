variable "release_name" {
  type        = string
  default     = "argocd"
  description = "Name of helm release"
}

variable "repository" {
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
  description = "Helm repository url"
}

variable "chart" {
  type    = string
  default = "argo-cd"
}

variable "namespace" {
  type        = string
  default     = "argocd"
  description = "Namespace for argocd resources"
}

variable "create_ns" {
  type        = bool
  default     = true
  description = "Create <argocd> ns if not exist or not"
}

variable "chart_version" {
  type    = string
  default = "3.35.4"
}

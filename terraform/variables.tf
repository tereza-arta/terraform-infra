#Variables for argocd helm-release
variable "release_name" {
  type        = string
  default     = "argocd"
  description = "Name of argocd helm release"
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

#Variables for metallb helm_release
variable "mlb_release_name" {
  type        = string
  default     = "metallb"
  description = "Name of metallb helm release"
}

variable "mlb_repository" {
  type        = string
  default     = "https://metallb.github.io/metallb"
  description = "Helm repository url for metallb"
}

variable "mlb_chart" {
  type    = string
  default = "metallb"
}

variable "mlb_namespace" {
  type        = string
  default     = "metallb_system"
  description = "Namespace for metallb resources"
}

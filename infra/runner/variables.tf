variable "runner_k8s_config" {
  type        = string
  description = "Name for the k8s secret required to configure gh runners on AKS"
  default     = "runner-k8s-config"
}

variable "runner_labels" {
  type        = string
  description = "Additional labels for runners"
}

variable "repo_name" {
  type        = string
  description = "Name of the repo for the Github Action"
}

variable "repo_owner" {
  type        = string
  description = "Owner of the repo for the Github Action"
}

variable "gh_token" {
  type        = string
  description = "Github token that is used for generating Self Hosted Runner Token"
}

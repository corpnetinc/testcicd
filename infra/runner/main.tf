provider "kubernetes" {
    config_path    = "~/.kube/config"
    config_context = "runner"
}

resource "kubernetes_secret" "runner-secrets" {
  metadata {
    name = var.runner_k8s_config
  }
  data = {
    gh_token      = var.gh_token
    repo_owner    = var.repo_owner
    repo_name     = var.repo_name
    runner_labels = var.runner_labels
  }
}

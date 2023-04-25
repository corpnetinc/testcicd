provider "kubernetes" {
    config_path    = "~/.kube/config"
    config_context = "runner"
}

resource "kubernetes_secret" "adf-shir-secrets" {
  metadata {
    name = var.adf_shir_k8s_config
  }
  data = {
    auth_key                 = var.auth_key
    tenant_id                = var.tenant_id
    client_id                = var.client_id
    client_secret            = var.client_secret
    subscription_id          = var.subscription_id
    resource_group_name      = var.resource_group_name
    data_factory_name        = var.data_factory_name
    integration_runtime_name = var.integration_runtime_name
  }
}

variable "adf_shir_k8s_config" {
  type        = string
  description = "Name for the k8s secret required to configure self-hosted integration runtime (SHIR) on AKS"
  default     = "adf-shir-k8s-config"
}

variable "auth_key" {
  type        = string
  description = "Authentication key for ADF"
}

variable "tenant_id" {
    type        = string
    description = "Azure App Tenant ID"
}

variable "client_id" {
    type        = string
    description = "Azure App Client ID"
}

variable "client_secret" {
    type        = string
    description = "Azure App Client Secret"
}

variable "subscription_id" {
    type        = string
    description = "Azure Subscription ID"
}

variable "resource_group_name" {
    type        = string
    description = "Azure Resource Group name"
}

variable "data_factory_name" {
    type        = string
    description = "Azure Data Factory name"
}

variable "integration_runtime_name" {
    type        = string
    description = "Azure Integration Runtime name"
}
/*
curl -X POST -i -d 'client_id=00b355c3-810a-47ee-afc4-f5ff8a10e44a&scope=https%3A%2F%2Fmanagement.core.windows.net%2F.default&client_secret=H208Q~mJAd01ssXBWLvY3oI45u4wlAp.VP8HScO6&grant_type=client_credentials' https://login.microsoftonline.com/63291dd2-f49c-4141-9e2f-3f2628688060/oauth2/v2.0/token
curl -X DELETE -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiJodHRwczovL21hbmFnZW1lbnQuY29yZS53aW5kb3dzLm5ldCIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzYzMjkxZGQyLWY0OWMtNDE0MS05ZTJmLTNmMjYyODY4ODA2MC8iLCJpYXQiOjE2ODIwNzk4MjUsIm5iZiI6MTY4MjA3OTgyNSwiZXhwIjoxNjgyMDgzNzI1LCJhaW8iOiJFMlpnWUtpK25acDc2ZDRMN1FzRjZnOTVMYXc1QUE9PSIsImFwcGlkIjoiMDBiMzU1YzMtODEwYS00N2VlLWFmYzQtZjVmZjhhMTBlNDRhIiwiYXBwaWRhY3IiOiIxIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvNjMyOTFkZDItZjQ5Yy00MTQxLTllMmYtM2YyNjI4Njg4MDYwLyIsImlkdHlwIjoiYXBwIiwib2lkIjoiYzFlYWYzZWItN2U4My00NGVlLWFmMWQtZTRlN2Y0MDk0Y2NkIiwicmgiOiIwLkFVNEEwaDBwWTV6MFFVR2VMejhtS0dpQVlFWklmM2tBdXRkUHVrUGF3ZmoyTUJPREFBQS4iLCJzdWIiOiJjMWVhZjNlYi03ZTgzLTQ0ZWUtYWYxZC1lNGU3ZjQwOTRjY2QiLCJ0aWQiOiI2MzI5MWRkMi1mNDljLTQxNDEtOWUyZi0zZjI2Mjg2ODgwNjAiLCJ1dGkiOiJQdGxrZDN1QVowU0FEem5PRlVGUUFBIiwidmVyIjoiMS4wIiwieG1zX3RjZHQiOjE2ODEzNzQ2NDF9.UKNAnK-glWrubOErHoS9CadjQZLbfimi1K5NBRZMHgVbnQ57F6fBDJuyaRO_dTNpZaupEMxh_4v0iRFHcrr620VuceGDq-YqV8ZDApRgF-Y7xTRZGKdYsLOjYFrx55GwzuVzU-raiEh9Jq15rI4lZ9T0DbtaJWLVeRIdAYh6omKaoDLDNprITOjQeqr87HTseWhBdoLdPzVUKJKwvt-cfVmQQvuULTINcNdft2xGk9YVTsyikHyu0wxrFQVFbnSSlbKKVc5A0fPNXJvcr8i4FNztJs-t2feflmvJTbvx4tCDZ2Eek5w2X9L3-sDckGLJjMN-Gymw2A1rSubWdm635A"
'https://management.azure.com/subscriptions/9185f379-6bf7-4b7c-9de4-262d8387cc8e/resourceGroups/runner/providers/Microsoft.DataFactory/factories/corpnet-test-adf/integrationRuntimes/integrationRuntime1/nodes/a60dba120543?api-version=2018-06-01' -i

*/

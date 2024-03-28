# 99.outputs.tf

# output "" {
#     value = 
# }

################################################
# AZUREAD OUTPUTS
################################################

# AzureAD Groups

output "azuread_group_id" {
  value = azuread_group.demo-oidc-group-example.id
}

output "azuread_group_owner" {
  value = azuread_group.demo-oidc-group-example.owners
}

output "azuread_group_object_id" {
  value = azuread_group.demo-oidc-group-example.object_id
}

# AzureAD Application Registration ID
output "azuread_application_id" {
  value       = azuread_application.demo-oidc-example.id
  description = "`oidc_client_id`"
}

# OIDC `oidc_client_id` for the AzureAD Application Registration
output "azuread_application_client_id" {
  value       = azuread_application.demo-oidc-example.client_id
  description = "`oidc_client_id`"
}

output "oidc_client_id" {
  value       = azuread_application.demo-oidc-example.client_id
  description = "`oidc_client_id`"
}

output "azuread_application_object_id" {
  value = azuread_application.demo-oidc-example.object_id
}

# `oidc_discovery_url`
output "azuread_application_oidc_metadata_document" {
  value       = "https://login.microsoftonline.com/${var.azure_tenant_id}/v2.0/"
  description = "`oidc_discovery_url`"
}
output "oidc_discovery_url" {
  value       = "https://login.microsoftonline.com/${var.azure_tenant_id}/v2.0/"
  description = "`oidc_discovery_url`"
}

# `oidc_client_secret`
output "azuread_application_password" {
  value       = azuread_application_password.demo-oidc-password-example.value
  description = "`oidc_client_secret`"
  sensitive   = true
}
output "oidc_client_secret" {
  value       = azuread_application_password.demo-oidc-password-example.value
  description = "`oidc_client_secret`"
  sensitive   = true
}

output "azuread_application_password_id" {
  value = azuread_application_password.demo-oidc-password-example.id
}

output "azuread_application_password_key_id" {
  value = azuread_application_password.demo-oidc-password-example.key_id
}

# AzureAD / Entra MS Graph Data Structure
# Uncomment to inspect the data structure
# output "msgraph" {
#   value = data.azuread_service_principal.msgraph
# }

# output "azuread_application_client_secret" {
#   value = azuread_application.demo-oidc-example.
# }

# output "azuread_application_url" {
#   value = azuread_application_redirect_uris.demo-oidc-redirect-example.
# }


################################################
# VAULT OUTPUTS
################################################

# output "" {
#   value = 
#   description = ""
# }

# output "vault_identity_group_external_id" {
#   value       = vault_identity_group.oidc_provider_azure_group.id
#   description = "Vault Identity Group External ID"
# }

# output "vault_jwt_auth_backend_mount_accessor" {
#   value       = vault_jwt_auth_backend.oidc_provider_azure.accessor
#   description = "Vault Auth OIDC Backend Mount Accessor"
# }

# output "mount_accessor" {
#   value       = vault_jwt_auth_backend.oidc_provider_azure.accessor
#   description = "Vault Auth OIDC Backend Mount Accessor"
# }






# 02-01.vault.oidc_provider.tf

resource "vault_jwt_auth_backend" "oidc_provider_azure" {
  depends_on = [
    azuread_application.demo-oidc-example
  ]
  # depends_on         = [azuread_application.demo-oidc-example]
  description        = "JWT/OIDC Auth Backend for OIDC Provider to IDP AzureAD / Entra"
  path               = var.vault_auth_mount_path
  type               = "oidc"
  default_role       = "oidc-azure-role"
  oidc_discovery_url = "https://login.microsoftonline.com/${var.azure_tenant_id}/v2.0"
  oidc_client_id     = azuread_application.demo-oidc-example.client_id
  # oidc_client_id     = azuread_application.demo-oidc-example.client_id
  oidc_client_secret = azuread_application_password.demo-oidc-password-example.value
  #  bound_issuer       = "https://login.microsoftonline.com/${var.azure_tenant_id}/v2.0"
  provider_config = {
    "provider" = "azure"
  }
  # tune {
  #     listing_visibility = "unauth"
  # }
}

resource "vault_jwt_auth_backend_role" "oidc_provider_azure_role" {
  backend   = vault_jwt_auth_backend.oidc_provider_azure.path
  role_name = "oidc-azure-role"
  #  user_claim           = "oid"
  user_claim           = "sub"
  groups_claim         = "groups"
  role_type            = "oidc"
  verbose_oidc_logging = true
  oidc_scopes = [
    "https://graph.microsoft.com/.default",
    "profile",
    # "email",
  ]
  token_policies = [
    # "p.global.crudl"
  ]
  allowed_redirect_uris = [
    "http://localhost:8250/oidc/callback",
    # "${var.vault_url}:${var.vault_cli_port}/oidc/callback",
    # "${var.vault_url}/oidc/callback",
    # "${var.vault_url}:${var.vault_port}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
    "${var.vault_url}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
  ]
}


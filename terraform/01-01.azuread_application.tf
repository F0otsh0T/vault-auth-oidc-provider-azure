# 01-01.azuread_application.tf

################################################
# DATA

# Data Source `azuread_client_config`
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config
data "azuread_client_config" "current" {}

# Data Source `azuread_application_published_app_ids`
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application_published_app_ids
data "azuread_application_published_app_ids" "well_known" {}

# Data Source `azuread_service_principal`
# https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal
data "azuread_service_principal" "msgraph" {
  client_id = data.azuread_application_published_app_ids.well_known.result["MicrosoftGraph"]
}

################################################
# APPLICATION AND REGISTRATION

# resource "azuread_application_registration" "demo-oidc-example" {
#     display_name = "${var.user}-demo-oidc-example"
#     description  = "AzureAD Application Registration - OIDC Example for Demo"
#     group_membership_claims = [
#         "All",
#     ]
# }

resource "azuread_application" "demo-oidc-example" {
  display_name = "${var.user}-demo-oidc-example"
  description  = "AzureAD Application - OIDC Example for Demo"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  group_membership_claims = [ # https://learn.microsoft.com/en-us/entra/identity-platform/optional-claims#configuring-group-optional-claims
    "All",
  ]
  required_resource_access {                                                                      # 
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph # "00000003-0000-0000-c000-000000000000" # Microsoft Graph @ https://learn.microsoft.com/en-us/troubleshoot/azure/active-directory/verify-first-party-apps-sign-in#application-ids-of-commonly-used-microsoft-applications
    resource_access {
      id   = data.azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"] # "e1fe6dd8-ba31-4d61-89e7-88639da4683d" # User.Read @ https://learn.microsoft.com/en-us/graph/permissions-reference#userread
      type = "Scope"
    }
  }
  #   public_client {
  #     redirect_uris = [
  #       "http://localhost:8250/oidc/callback",
  #       "${var.vault_url}:${var.vault_cli_port}/oidc/callback",
  #       "${var.vault_url}:${var.vault_port}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
  #     ]
  #   }
  web {
    redirect_uris = [
      "http://localhost:8250/oidc/callback",
      #   "${var.vault_url}:${var.vault_cli_port}/oidc/callback",
      #   "${var.vault_url}/oidc/callback",
      #   "${var.vault_url}:${var.vault_port}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
      "${var.vault_url}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
    ]
  }
}

################################################
# APPLICATION REDIRECT URLS

# resource "azuread_application_redirect_uris" "demo-oidc-redirect-example" {
#   application_id = azuread_application.demo-oidc-example.id
#   type           = "Web"
#   redirect_uris = [
#     "http://localhost:8250/oidc/callback",
#   #  "${var.vault_url}:${var.vault_cli_port}/oidc/callback",
#     "${var.vault_url}/oidc/callback",
#   #  "${var.vault_url}:${var.vault_port}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
#     "${var.vault_url}/ui/vault/auth/${var.vault_auth_mount_path}/oidc/callback"
#   ]
# }

################################################
# APPLICATION PASSWORD / OIDC CLIENT SECRET

resource "azuread_application_password" "demo-oidc-password-example" {
  application_id = azuread_application.demo-oidc-example.id
}

################################################
# SERVICE PRINCIPAL - NOT NECCESSARY

resource "azuread_service_principal" "demo-oidc-example" {
  client_id = azuread_application.demo-oidc-example.client_id
  owners = [
    data.azuread_client_config.current.object_id
  ]
}

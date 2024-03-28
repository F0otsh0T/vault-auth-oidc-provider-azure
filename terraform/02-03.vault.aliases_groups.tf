# 02-03.vault.aliases_groups.tf

################################################
# VAULT IDENTITY GROUPS AND ALIASES

# GROUP: example - this group is used to map the Azure AD groups to Vault policies
resource "vault_identity_group" "oidc_provider_azure_group_example" {
  name = "oidc_provider_azure_group_example"
  type = "external"
  policies = [

  ]
}
resource "vault_identity_group_alias" "oidc_provider_azure_group_example_alias" {
  name           = azuread_group.demo-oidc-group-example.object_id
  mount_accessor = vault_jwt_auth_backend.oidc_provider_azure.accessor
  canonical_id   = vault_identity_group.oidc_provider_azure_group_example.id
}

# GROUP: super-admin - this group is used to map the Azure AD groups to Vault policies
resource "vault_identity_group" "oidc_provider_azure_group_super_admin" {
  name = "oidc_provider_azure_group_super_admin"
  type = "external"
  policies = [
    vault_policy.vault_super_admin.name,
  ]
}
resource "vault_identity_group_alias" "oidc_provider_azure_group_super_admin_alias" {
  name           = azuread_group.demo-oidc-group-super-admin.object_id
  mount_accessor = vault_jwt_auth_backend.oidc_provider_azure.accessor
  canonical_id   = vault_identity_group.oidc_provider_azure_group_super_admin.id
}

# GROUP: admin - this group is used to map the Azure AD groups to Vault policies
resource "vault_identity_group" "oidc_provider_azure_group_admin" {
  name = "oidc_provider_azure_group_admin"
  type = "external"
  policies = [
    vault_policy.vault_admin.name,
  ]
}
resource "vault_identity_group_alias" "oidc_provider_azure_group_admin_alias" {
  name           = azuread_group.demo-oidc-group-admin.object_id
  mount_accessor = vault_jwt_auth_backend.oidc_provider_azure.accessor
  canonical_id   = vault_identity_group.oidc_provider_azure_group_admin.id
}

# GROUP: app1 - this group is used to map the Azure AD groups to Vault policies
resource "vault_identity_group" "oidc_provider_azure_group_app1" {
  name = "oidc_provider_azure_group_app1"
  type = "external"
  metadata = {
    app-name = "app1"
  }
  policies = [
    vault_policy.app1_owner.name,
  ]
}
resource "vault_identity_group_alias" "oidc_provider_azure_group_app1_alias" {
  name           = azuread_group.demo-oidc-group-app1.object_id
  mount_accessor = vault_jwt_auth_backend.oidc_provider_azure.accessor
  canonical_id   = vault_identity_group.oidc_provider_azure_group_app1.id
}

# GROUP: app2 - this group is used to map the Azure AD groups to Vault policies
resource "vault_identity_group" "oidc_provider_azure_group_app2" {
  name = "oidc_provider_azure_group_app2"
  type = "external"
  metadata = {
    app-name = "app2"
  }
  policies = [
    vault_policy.app2_owner.name,
  ]
}
resource "vault_identity_group_alias" "oidc_provider_azure_group_app2_alias" {
  name           = azuread_group.demo-oidc-group-app2.object_id
  mount_accessor = vault_jwt_auth_backend.oidc_provider_azure.accessor
  canonical_id   = vault_identity_group.oidc_provider_azure_group_app2.id
}


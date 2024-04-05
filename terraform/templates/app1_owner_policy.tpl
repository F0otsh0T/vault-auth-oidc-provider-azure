path "secret/data/{{identity.groups.names.oidc_provider_azure_group_app1.metadata.app-name}}"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/metadata/{{identity.groups.names.oidc_provider_azure_group_app1.metadata.app-name}}"
{
  capabilities = ["read", "list"]
}

path "secret/metadata/*"
{
  capabilities = ["list"]
}
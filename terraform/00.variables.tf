# 00.variables.tf

# variable "" {
#     type = string
#     description = ""
#     sensitive = false
#     default = ""
# }

################################################
# DEMO VARIABLES

variable "user" {
  type        = string
  description = "Demo User"
  sensitive   = false
  default     = "user"
}

################################################
# AZURE VARIABLES

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = false
  default     = ""
}

################################################
# VAULT VARIABLES

variable "vault_root_token" {
  type        = string
  description = "Vault Root Token"
  sensitive   = false
  default     = ""
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
  sensitive   = false
  default     = "http://localhost:8200"
}

variable "vault_port" {
  type        = string
  description = "Vault Port"
  sensitive   = false
  default     = "8200"
}

variable "vault_cli_port" {
  type        = string
  description = "Vault CLI Port"
  sensitive   = false
  default     = "8250"
}

variable "vault_auth_mount_path" {
  type        = string
  description = "Vault Authentication Mount Path"
  sensitive   = false
  default     = "oidc-azure"
}





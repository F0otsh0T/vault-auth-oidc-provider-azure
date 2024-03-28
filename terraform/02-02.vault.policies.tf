# 02-02.vault.policies.tf

################################################
# VAULT POLICIES

resource "vault_policy" "vault_super_admin" {
  name   = "vault-super-admin"
  policy = templatefile("${path.module}/templates/vault_super_admin_policy.tpl", {})
}

resource "vault_policy" "vault_admin" {
  name   = "vault-admin"
  policy = templatefile("${path.module}/templates/vault_admin_policy.tpl", {})
}

resource "vault_policy" "app1_owner" {
  name   = "app1-owner"
  policy = templatefile("${path.module}/templates/app1_owner_policy.tpl", {})
}

resource "vault_policy" "app1_reader" {
  name   = "app1-reader"
  policy = templatefile("${path.module}/templates/app1_reader_policy.tpl", {})
}

resource "vault_policy" "app2_owner" {
  name   = "app2-owner"
  policy = templatefile("${path.module}/templates/app2_owner_policy.tpl", {})
}

resource "vault_policy" "app2_reader" {
  name   = "app2-reader"
  policy = templatefile("${path.module}/templates/app2_reader_policy.tpl", {})
}






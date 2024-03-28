# 02-04.secrets.tf

################################################
# VAULT SECRETS ENGINE: KVv2

resource "vault_mount" "kvv2" {
  type        = "kv"
  description = "KVv2 Secret Engine Mount"
  options     = { version = "2" }
  path        = "secret"
}

resource "vault_kv_secret_v2" "app1_secret" {
  mount               = vault_mount.kvv2.path
  name                = "app1"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      zip = "zap1",
      foo = "bar1"
    }
  )
}

resource "vault_kv_secret_v2" "app2_secret" {
  mount               = vault_mount.kvv2.path
  name                = "app2"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      zip = "zap2",
      foo = "bar2"
    }
  )
}






# 02.azuread.groups.tf

# data "azuread_client_config" "current" {}

resource "azuread_group" "demo-oidc-group-example" {
  display_name = "${var.user}-demo-oidc-group-example"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  security_enabled = true
}

resource "azuread_group" "demo-oidc-group-super-admin" {
  display_name = "${var.user}-demo-oidc-group-super-admin"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  security_enabled = true
}

resource "azuread_group" "demo-oidc-group-admin" {
  display_name = "${var.user}-demo-oidc-group-admin"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  security_enabled = true
}

resource "azuread_group" "demo-oidc-group-app1" {
  display_name = "${var.user}-demo-oidc-group-app1"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  security_enabled = true
}

resource "azuread_group" "demo-oidc-group-app2" {
  display_name = "${var.user}-demo-oidc-group-app2"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  security_enabled = true
}







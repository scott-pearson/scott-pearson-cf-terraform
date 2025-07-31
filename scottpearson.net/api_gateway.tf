resource "cloudflare_api_shield" "session_identifier" {
  zone_id = var.cloudflare_zone_id
  auth_id_characteristics = [
    {
      name = "authorization"
      type = "header"
    }
  ]
}

# Bug with this - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5794
#resource "cloudflare_api_shield_schema_validation_settings" "zone_level_settings" {
#  zone_id                               = var.cloudflare_zone_id
#  validation_default_mitigation_action  = "log"
#}

resource "cloudflare_api_shield_operation" "find_by_status" {
  endpoint = "/api/v3/pet/findByStatus"
  host     = "api.scottpearson.net"
  method   = "GET"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_api_shield_operation" "inventory" {
  endpoint = "/api/v3/store/inventory"
  host     = "api.scottpearson.net"
  method   = "GET"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_api_shield_operation" "login" {
  endpoint = "/api/v3/user/login"
  host     = "api.scottpearson.net"
  method   = "GET"
  zone_id  = var.cloudflare_zone_id
}

resource "cloudflare_api_shield_operation" "logout" {
  endpoint = "/api/v3/user/logout"
  host     = "api.scottpearson.net"
  method   = "GET"
  zone_id  = var.cloudflare_zone_id
}

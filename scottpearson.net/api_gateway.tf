resource "cloudflare_api_shield" "session_identifier" {
  zone_id = var.cloudflare_zone_id
  auth_id_characteristics = [
    {
      name = "116c0a3d-6be8-43c4-a355-8b2a3704e991:$.name"
      type = "jwt"
    },
    {
      name = "authorization"
      type = "header"
    }
  ]
}

# Bug with this - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5794
#resource "cloudflare_api_shield_schema_validation_settings" "zone_level_settings" {
#  zone_id                               = var.cloudflare_zone_id
#  validation_default_mitigation_action  = "block"
#}

# Bug with this - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5749
#resource "cloudflare_api_shield_operation" "endpoint_1" {
#  endpoint = "/v3/pet"
#  host     = "api.scottpearson.net"
#  method   = "PUT"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_2" {
#  endpoint = "/v3/pet"
#  host     = "api.scottpearson.net"
#  method   = "POST"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_3" {
#  endpoint = "/v3/pet/findByStatus"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_4" {
#  endpoint = "/v3/pet/findByTags"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_5" {
#  endpoint = "/v3/pet/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "POST"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_6" {
#  endpoint = "/v3/pet/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "DELETE"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_7" {
#  endpoint = "/v3/pet/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_8" {
#  endpoint = "/v3/store/inventory"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_9" {
#  endpoint = "/v3/store/order"
#  host     = "api.scottpearson.net"
#  method   = "POST"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_10" {
#  endpoint = "/v3/store/order/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "DELETE"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_11" {
#  endpoint = "/v3/store/order/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_12" {
#  endpoint = "/v3/user"
#  host     = "api.scottpearson.net"
#  method   = "POST"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_13" {
#  endpoint = "/v3/user/createWithList"
#  host     = "api.scottpearson.net"
#  method   = "POST"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_14" {
#  endpoint = "/v3/user/login"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_15" {
#  endpoint = "/v3/user/logout"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_16" {
#  endpoint = "/v3/user/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "DELETE"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_17" {
#  endpoint = "/v3/user/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "PUT"
#  zone_id  = var.cloudflare_zone_id
#}

#resource "cloudflare_api_shield_operation" "endpoint_18" {
#  endpoint = "/v3/user/{var1}"
#  host     = "api.scottpearson.net"
#  method   = "GET"
#  zone_id  = var.cloudflare_zone_id
#}

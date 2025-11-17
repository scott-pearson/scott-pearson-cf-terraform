# Currently there is an issue with this resource as it will update in place on each apply - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5627
resource "cloudflare_managed_transforms" "managed_transforms" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id 
  managed_request_headers = [
    {
      id      = "add_bot_protection_headers"
      enabled = true
    },
    {
      id      = "add_visitor_location_headers"
      enabled = true
    },
    {
      id      = "add_client_certificate_headers"
      enabled = true
    },
    {
      id      = "add_waf_credential_check_status_header"
      enabled = true
    }
  ]
  managed_response_headers = [
    {
      id      = "add_security_headers"
      enabled = true
    },
    {
      id      = "remove_x-powered-by_header"
      enabled = true
    }
  ]
}

resource "cloudflare_ruleset" "reqheader_transforms" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id
  name        = "default"
  description = ""
  kind        = "zone"
  phase       = "http_request_late_transform"
  rules = [
    {
      action            = "rewrite"
      action_parameters = {
        headers = {
          x-country = {
            expression = "ip.src.country"
            operation  = "set"
          }
        }
      }
      description = "Send Country in Custom Header"
      enabled     = true
      expression  = true
      ref         = "reqheader_transform1"
    }
  ]
}

resource "cloudflare_ruleset" "resheader_transforms" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id
  name        = "default"
  description = ""
  kind        = "zone"
  phase       = "http_response_headers_transform"
  rules = [
    {
      action            = "rewrite"
      action_parameters = {
        headers = {
          x-country = {
            expression = "ip.src.country"
            operation  = "set"
          }
        }
      }
      description = "Send Country in Custom Response Header"
      enabled     = true
      expression  = true
      ref         = "resheader_transform1"
    }
  ]
}

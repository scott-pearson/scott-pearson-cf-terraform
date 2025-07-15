# Currently there is an issue with this resource as it will update in place on each apply - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5627
#resource "cloudflare_managed_transforms" "managed_transforms" {
#  zone_id = var.cloudflare_zone_id
#  managed_request_headers = [
#    {
#      id = "add_bot_protection_headers"
#      enabled = true
#    },
#    {
#      id = "add_visitor_location_headers"
#      enabled = true
#    }
#  ]
#  managed_response_headers = [
#    {
#      id = "remove_x-powered-by_header"
#      enabled = true
#    },
#    {
#      id = "add_security_headers"
#      enabled = true
#    }
#  ]
#}

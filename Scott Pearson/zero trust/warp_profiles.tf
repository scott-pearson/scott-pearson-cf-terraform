## Issue with this here https://github.com/cloudflare/terraform-provider-cloudflare/issues/6188

#resource "cloudflare_zero_trust_device_custom_profile" "default-copy" {
#  account_id                     = var.cloudflare_account_id
#  name                           = "Scott Pearson"
#  match                          = "identity.email in {\"scottkpearson1@gmail.com\" \"grayfox0014@gmail.com\"}"
#  precedence                     = 100
#  allow_mode_switch              = true
#  allow_updates                  = true
#  allowed_to_leave               = true
#  auto_connect                   = off
#  captive_portal                 = 120
#  disable_auto_fallback          = false
#  enabled                        = true
#  exclude_office_ips             = true
#  register_interface_ip_with_dns = true
#  sccm_vpn_boundary_support      = false
#  switch_locked                  = false
#  exclude = [{
#    address = "10.0.0.0/8"
#    }, {
#    address = "100.64.0.0/10"
#    }, {
#    address = "169.254.0.0/16"
#    }, {
#    address = "172.16.0.0/12"
#    }, {
#    address = "192.0.0.0/24"
#    }, {
#    address = "192.168.0.0/16"
#    }, {
#    address = "224.0.0.0/24"
#    }, {
#    address = "240.0.0.0/4"
#    }, {
#    address = "255.255.255.255/32"
#    }, {
#    address = "fe80::/10"
#    }, {
#    address = "fd00::/8"
#    }, {
#    address = "ff01::/16"
#    }, {
#    address = "ff02::/16"
#    }, {
#    address = "ff03::/16"
#    }, {
#    address = "ff04::/16"
#    }, {
#    address = "ff05::/16"
#  }]
#  service_mode_v2 = {
#    mode = "warp"
#  }
#  support_url = "https://1.1.1.1/help"
#}

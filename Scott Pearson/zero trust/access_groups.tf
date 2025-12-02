resource "cloudflare_zero_trust_access_group" "my_emails" {
  account_id = var.cloudflare_account_id
  name = "My Emails"
  include = [
    {
      email = {
        email = "scott@cloudflare.com"
      }
    },
    {
      email = {
        email = "grayfox0014@gmail.com"
      }
    },
    {
      email = {
        email = "scottkpearson1@gmail.com"
      }
    }
  ]
  require = []
  exclude = []
  is_default = true
}

resource "cloudflare_zero_trust_access_group" "my_warp" {
  account_id = var.cloudflare_account_id
  name = "Warp Enforcement"
  include = [
    {
      device_posture = {
        integration_uid = cloudflare_zero_trust_device_posture_rule.gateway.id 
      }
    }
  ]
  require = []
  exclude = []
}

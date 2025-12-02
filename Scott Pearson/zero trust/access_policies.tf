resource "cloudflare_zero_trust_access_policy" "allow_emails_access_policy" {
  account_id = var.cloudflare_account_id
  decision   = "allow"
  exclude    = [] 
  include = [
    {
      group = {
        id = cloudflare_zero_trust_access_group.my_emails.id
      }
    }
  ]
  name                           = "Allow My Emails"
  approval_required              = false
  isolation_required             = false
  purpose_justification_required = false
  require = []
  session_duration = "24h"
}

resource "cloudflare_zero_trust_access_policy" "allow_gateway_access_policy" {
  account_id = var.cloudflare_account_id
  decision   = "allow"
  exclude    = [] 
  include = [
    {
      group = {
        id = cloudflare_zero_trust_access_group.my_warp.id
      }
    }
  ]
  name                           = "Allow WARP"
  approval_required              = false
  isolation_required             = false
  purpose_justification_required = false
  require = []
  session_duration = "24h"
}

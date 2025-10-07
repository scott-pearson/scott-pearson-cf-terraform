resource "cloudflare_zero_trust_access_identity_provider" "otp_idp" {
  account_id = var.cloudflare_account_id
  name       = "onetimepin"
  type       = "onetimepin"
  config = {}
}

resource "cloudflare_zero_trust_access_identity_provider" "github_idp" {
  account_id = var.cloudflare_account_id
  name       = "GitHub"
  type       = "github"
  config = {
    client_id     = var.github_id 
    client_secret = var.githib_secret
  }
  scim_config = {
    identity_update_behavior = "no_action"
  }
}


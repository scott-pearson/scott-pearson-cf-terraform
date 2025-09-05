# Not working due to https://github.com/cloudflare/terraform-provider-cloudflare/issues/5716
resource "cloudflare_account" "Scott_Pearson_account" {
  name = "Scott Pearson"
  type = "enterprise"
  settings = {
    enforce_twofactor = true
    abuse_contact_email = "scott@cloudflare.com"
  }
}

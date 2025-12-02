# Bug with this https://github.com/cloudflare/terraform-provider-cloudflare/issues/5893 will always try and change description
resource "cloudflare_zero_trust_device_posture_rule" "gateway" {
  account_id = var.cloudflare_account_id
  name = "gateway"
  type = "gateway"
}

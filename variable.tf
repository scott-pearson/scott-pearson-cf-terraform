#variable "cloudflare_api_token" {
#  description = "Cloudflare API token with necessary permissions."
#  type        = string
#  sensitive   = true
#}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID"
  type        = string
  sensitive   = false
}

variable "firewallPubKey" {
  description = "Public key to decrypt firewall events"
  type        = string
  sensitive   = true
}

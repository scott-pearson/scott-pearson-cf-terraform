variable "cloudflare_api_token" {
  description = "Cloudflare API token with necessary permissions."
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "firewallPubKey" {
  description = "Public key to decrypt firewall events"
  type        = string
  sensitive   = true
}

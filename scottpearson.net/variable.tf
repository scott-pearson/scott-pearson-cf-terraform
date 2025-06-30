variable "cloudflare_api_token" {
  description = "Cloudflare API Token with necessary permissions."
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
  sensitive   = false
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID"
  type        = string
  sensitive   = false
}



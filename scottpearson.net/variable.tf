variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
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

variable "aop_cert" {
  type      = string
  description = "Certificate for Authenticated Origin Pulls"
  sensitive = true
}

variable "aop_key" {
  type      = string
  description = "Private key for Authenticated Origin Pulls"
  sensitive = true
}

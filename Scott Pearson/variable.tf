# Variable values are defined in terraform.tfvars file stored locally

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
  sensitive   = false
}

variable "cloudflare_account_name" {
  description = "Cloudflare Account Name"
  type        = string
  sensitive   = false
}

variable "cloudflare_account_type" {
  description = "Cloudflare Account Type"
  type        = string
  sensitive   = false
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

variable "origin_ips" {
  description = "A list of origin IP addresses to add to the Cloudflare IP lists"
  type        = set(string)
  sensitive   = false
}

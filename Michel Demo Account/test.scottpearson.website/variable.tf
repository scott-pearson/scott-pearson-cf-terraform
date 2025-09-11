# Variable values stored in terraform.tfvars file locally

#variable "cloudflare_api_token" {
#  description = "Cloudflare API token"
#  type        = string
#  sensitive   = true
#}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
  sensitive   = false
}

variable "cloudflare_zone_name" {
  description = "Cloudflare Zone Name"
  type        = string
  sensitive   = false
}

variable "cloudflare_zone_type" {
  description = "Cloudflare Zone Type"
  type        = string
  sensitive   = false
}

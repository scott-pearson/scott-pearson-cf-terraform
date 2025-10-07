# Variable values are defined in terraform.tfvars file stored locally

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Account ID"
  type        = string
  sensitive   = false
}

variable "github_id" {
  description = "Client ID for github IDP"
  type        = string
  sensitive   = false
}

variable "githib_secret" {
  description = "Client secret for github IDP"
  type        = string
  sensitive   = true
}

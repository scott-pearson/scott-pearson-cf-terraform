terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }

  backend "s3" {
    bucket = "scott-pearson-tf-state"
    key    = "Scott Pearson/terraform.tfstate"
    region                      = "auto"
    use_lockfile                = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true    
    use_path_style              = true
    endpoints = { s3 = "https://c375fad1094608dd251c2a7fdea837eb.r2.cloudflarestorage.com" }
  }
}

provider "cloudflare" {
# too many things don't work with account_api_tokens at this time using $CLOUDFLARE_EMAIL and $CLOUDFLARE_API_KEY env variables instead
# api_token = $CLOUDFLARE_API_TOKEN

# For security these values are defined as environment variables locally rather than hardcoded, if you plan to manage tf through git or other version control consider use of environment variables or a tfvars file that is not tracked
# email = $CLOUDFLARE_EMAIL
# api_key = $CLOUDFLARE_API_KEY
}

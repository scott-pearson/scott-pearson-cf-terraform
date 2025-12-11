data "cloudflare_account_api_token_permission_groups_list" "permissions" {
  account_id = cloudflare_account.Scott_Pearson_account.id
}

locals {
  permissions_map = merge([
    for c in data.cloudflare_account_api_token_permission_groups_list.permissions.result :
    { (c.name) = c.id }
  ]...)
}

# Use to output the permission names if needed
#output "permission_names" {
#  description = "output permission names"
#  value       = keys(local.permissions_map)
#}

resource "cloudflare_account_token" "r2_account_token" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  name = "R2 Account Token"
  policies = [
    {
      effect = "allow"
      resources = jsonencode({
        "com.cloudflare.api.account.${cloudflare_account.Scott_Pearson_account.id}" = "*"
      })
      permission_groups = [
        for p in [
          "Workers R2 SQL Read",
          "Workers R2 Data Catalog Write",
          "Workers R2 Storage Write"
        ] :
        { id = local.permissions_map[p] }
      ]
    }
  ]
}

resource "cloudflare_account_token" "terraform_token" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  name = "Terraform Account Token"
  policies = [
    {
      effect = "allow"
      resources = jsonencode({
        "com.cloudflare.api.account.${cloudflare_account.Scott_Pearson_account.id}" = "*"
      })
      permission_groups = [
        for p in [
          "Account API Tokens Write",
          "Account Custom Pages Write",
          "Account Rulesets Write",
          "Account Settings Write",
          "Account: SSL and Certificates Write",
          "Account WAF Write",
          "Mass URL Redirects Write",
          "Pages Write",
          "Cloudflare Tunnel Write",
          "DDoS Protection Write",
          "Load Balancing: Monitors and Pools Write",
          "Logs Write",
          "Notifications Write",
          "Transform Rules Write",
          "Workers Scripts Write"
        ] :
        { id = local.permissions_map[p] }
      ]
    },
    {
      effect = "allow"
      resources = jsonencode({
        "com.cloudflare.api.account.${cloudflare_account.Scott_Pearson_account.id}" = "*"
      })
      permission_groups = [
        for p in [
          "Zone Settings Write",
          "SSL and Certificates Write",
          "Zone Write"
        ] :
        { id = local.permissions_map[p] }
      ]
    }
  ]
}

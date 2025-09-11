resource "cloudflare_zone" "test_scottpearson_website_zone" {
  account = {
    id = var.cloudflare_account_id
  }
  name = var.cloudflare_zone_name
  type = var.cloudflare_zone_type
}

# Employee sub
#resource "cloudflare_zone_subscription" "test_scottpearson_website_sub" {
#  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
#  rate_plan = {
#    id = "enterprise"
#    currency = "USD"
#    externally_managed = false
#    is_contract = true
#    public_name = "Enterprise"
#    scope = "zone"
#  }
#}

resource "cloudflare_argo_tiered_caching" "tiered_caching" {
  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
  value = "on"
}

resource "cloudflare_tiered_cache" "smart_tiered_caching" {
  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
  value = "on"
}

resource "cloudflare_regional_tiered_cache" "regional_tiered_cache" {
  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
  value = "on"
}

resource "cloudflare_leaked_credential_check" "leaked_credential_check" {
  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
  enabled = true
}

resource "cloudflare_logpull_retention" "logpull_retention" {
  zone_id = cloudflare_zone.test_scottpearson_website_zone.id
  flag = true
}

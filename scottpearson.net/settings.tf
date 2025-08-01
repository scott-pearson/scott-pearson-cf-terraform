resource "cloudflare_argo_smart_routing" "smart_routing" {
  zone_id = var.cloudflare_zone_id
  value = "on"
}

resource "cloudflare_argo_tiered_caching" "tiered_caching" {
  zone_id = var.cloudflare_zone_id
  value = "on"
}

resource "cloudflare_tiered_cache" "smart_tiered_caching" {
  zone_id = var.cloudflare_zone_id
  value = "on"
}

resource "cloudflare_regional_tiered_cache" "regional_tiered_cache" {
  zone_id = var.cloudflare_zone_id
  value = "on"
}

resource "cloudflare_leaked_credential_check" "leaked_credential_check" {
  zone_id = var.cloudflare_zone_id
  enabled = true
}

resource "cloudflare_logpull_retention" "logpull_retention" {
  zone_id = var.cloudflare_zone_id
  flag = true
}

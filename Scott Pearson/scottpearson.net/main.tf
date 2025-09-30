resource "cloudflare_zone" "scottpearson_net_zone" {
  account = {
    id = var.cloudflare_account_id
  }
  name = var.cloudflare_zone_name
  type = var.cloudflare_zone_type
}

# Using employee sub which doesn't work with this
#resource "cloudflare_zone_subscription" "scottpearson_net_sub" {
#  zone_id = cloudflare_zone.scottpearson_net_zone.id
#  rate_plan = {
#    id = "enterprise"
#    currency = "USD"
#    externally_managed = false
#    is_contract = true
#    public_name = "Enterprise"
#    scope = "zone"
#  }
#}

# Define a list of zone settings that can be used in cloudflare_zone_settings
locals {
  zone_settings = {
    "0rtt"                        = "on"
    "always_online"               = "on"
    "always_use_https"            = "on"
    "automatic_https_rewrites"    = "on"
    "brotli"                      = "on"
    "browser_cache_ttl"           = 0
    "browser_check"               = "on"
    "cache_level"                 = "aggressive"
    "challenge_ttl"               = 86400
    "cname_flattening"            = "flatten_at_root"
    "development_mode"            = "off"
    "early_hints"                 = "on"
    "ech"                         = "off"
    "edge_cache_ttl"              = 7200
    "email_obfuscation"           = "off"
    # This 500s for some reason so commenting out
    #"hotlink_protection"          = "off"
    "http2"                       = "on"
    "http3"                       = "on"
    "ip_geolocation"              = "on"
    "ipv6"                        = "on"
    "long_lived_grpc"             = "off"
    "max_upload"                  = 500
    "min_tls_version"             = "1.2"
    "mirage"                      = "off"
    "opportunistic_encryption"    = "on"
    "opportunistic_onion"         = "on"
    "origin_error_page_pass_thru" = "off"
    "polish"                      = "lossless"
    "pq_keyex"                    = "on"
    "prefetch_preload"            = "on"
    "privacy_pass"                = "on"
    "proxy_read_timeout"          = "100"
    "pseudo_ipv4"                 = "off"
    "replace_insecure_js"         = "on"
    "response_buffering"          = "off"
    "rocket_loader"               = "on"
    "security_level"              = "essentially_off"
    "server_side_exclude"         = "on"
    "sort_query_string_for_cache" = "off"
    "ssl"                         = "strict"
    "tls_1_2_only"                = "off"
    "tls_1_3"                     = "zrt"
    "tls_client_auth"             = "off"
    "true_client_ip_header"       = "off"
    "waf"                         = "off"
    "webp"                        = "on"
    "websockets"                  = "on"
  }
}

resource "cloudflare_zone_setting" "zone_settings" {
  for_each = local.zone_settings
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  setting_id = each.key
  value = each.value
}

# The list above doesn't play nice with JSON strings and arrays so these need to be manually added
resource "cloudflare_zone_setting" "zone_settings_ciphers" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  setting_id = "ciphers"
  value = [
    "ECDHE-ECDSA-AES128-GCM-SHA256",
    "ECDHE-RSA-AES128-GCM-SHA256",
    "ECDHE-ECDSA-AES256-GCM-SHA384",
    "ECDHE-RSA-AES256-GCM-SHA384",
    "ECDHE-ECDSA-CHACHA20-POLY1305",
    "ECDHE-RSA-CHACHA20-POLY1305"
  ]
}

resource "cloudflare_zone_setting" "zone_settings_minify" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  setting_id = "minify"
  value = {
    "css": "off",
    "html": "off",
    "js": "off"
  }
}

resource "cloudflare_zone_setting" "zone_settings_mobile_redirect" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  setting_id = "mobile_redirect"
  value = {
    "status": "off",
    "mobile_subdomain": null,
    "strip_uri": false
  }
}

resource "cloudflare_zone_setting" "zone_settings_hsts" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  setting_id = "security_header"
  value = {
    "strict_transport_security": {
      "enabled": true,
      "max_age": 31556952,
      "include_subdomains": true,
      "preload": true,
      "nosniff": false
    }
  }
}

resource "cloudflare_zone_setting" "zone_settings_nel" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  setting_id = "nel"
  value = {
    "enabled": true
  }
}

resource "cloudflare_argo_smart_routing" "smart_routing" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  value = "on"
}

resource "cloudflare_argo_tiered_caching" "tiered_caching" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  value = "on"
}

resource "cloudflare_tiered_cache" "smart_tiered_caching" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  value = "on"
}

resource "cloudflare_regional_tiered_cache" "regional_tiered_cache" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  value = "on"
}

resource "cloudflare_zone_cache_reserve" "cache_reserve" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  value = "on"
}
resource "cloudflare_leaked_credential_check" "leaked_credential_check" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  enabled = true
}

resource "cloudflare_logpull_retention" "logpull_retention" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  flag = true
}

resource "cloudflare_url_normalization_settings" "url_normalization_settings" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  scope = "incoming"
  type = "rfc3986"
}

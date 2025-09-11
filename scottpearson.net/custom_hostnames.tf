resource "cloudflare_custom_hostname_fallback_origin" "fallback_origin" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  origin = "fallback.scottpearson.net"
}


# Currently a bug with the ssl parameter of this - https://github.com/cloudflare/terraform-provider-cloudflare/issues/5726
#resource "cloudflare_custom_hostname" "scott-ch-custom-hostname" {
#zone_id = cloudflare_zone.scottpearson_net_zone.id
#hostname = "scott-ch.mbamps.com"
  #ssl = {
  #bundle_method = "ubiquitous"
  #certificate_authority = "google"
  #cloudflare_branding = false
  #method = "txt"
    #settings = {
    #ciphers = ["ECDHE-ECDSA-AES128-GCM-SHA256", "ECDHE-ECDSA-AES256-GCM-SHA384", "ECDHE-ECDSA-CHACHA20-POLY1305"]
    #early_hints = "on"
    #http2 = "on"
    #min_tls_version = "1.2"
    #tls_1_3 = "on"
    #}
    #type = "dv"
    #wildcard = false
    #} 
    #}

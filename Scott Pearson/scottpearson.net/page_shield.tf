resource "cloudflare_page_shield_policy" "csp_policy" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id
  action      = "allow"
  description = "CSP Policy [Site]"
  enabled     = true
  expression  = "(http.host contains \"scottpearson.net\")"
  value       = "default-src 'self' 'unsafe-inline' 'unsafe-eval' static.cloudflareinsights.com fonts.gstatic.com fonts.googleapis.com secure.gravatar.com ps.w.org challenges.cloudflare.com data: blob:"
}

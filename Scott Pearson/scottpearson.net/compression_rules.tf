resource "cloudflare_ruleset" "compression_ruleset" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id
  name        = "default"
  description = ""
  kind        = "zone"
  phase       = "http_response_compression"
  rules = [
    {
      action            = "compress_response"
      action_parameters = {
        algorithms = [
          {
            name = "zstd"
          },
          {
            name = "brotli"
          },
          {
            name = "gzip"
          }
        ]
      }
      description = "Enable Zstd Compression"
      enabled     = true
      expression  = "(http.response.content_type.media_type in {\"text/html\" \"text/richtext\" \"text/plain\" \"text/css\" \"text/x-script\" \"text/x-component\" \"text/x-java-source\" \"text/x-markdown\" \"application/javascript\" \"application/x-javascript\" \"text/javascript\" \"text/js\" \"image/x-icon\" \"image/vnd.microsoft.icon\" \"application/x-perl\" \"application/x-httpd-cgi\" \"text/xml\" \"application/xml\" \"application/rss+xml\" \"application/vnd.api+json\" \"application/x-protobuf\" \"application/json\" \"multipart/bag\" \"multipart/mixed\" \"application/xhtml+xml\" \"font/ttf\" \"font/otf\" \"font/x-woff\" \"image/svg+xml\" \"application/vnd.ms-fontobject\" \"application/ttf\" \"application/x-ttf\" \"application/otf\" \"application/x-otf\" \"application/truetype\" \"application/opentype\" \"application/x-opentype\" \"application/font-woff\" \"application/eot\" \"application/font\" \"application/font-sfnt\" \"application/wasm\" \"application/javascript-binast\" \"application/manifest+json\" \"application/ld+json\" \"application/graphql+json\" \"application/geo+json\"})"
      ref         = "compression1"
    }
  ]
}

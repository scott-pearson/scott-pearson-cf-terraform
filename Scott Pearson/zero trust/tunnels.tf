resource "cloudflare_zero_trust_tunnel_cloudflared" "scott-api" {
  account_id = var.cloudflare_account_id 
  config_src = "cloudflare"
  name       = "Scott-API"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "scott-api-config" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.scott-api.id
  config = {
    ingress = [
      {
        hostname = "api-tunnel.scottpearson.net"
        service = "http://localhost:80"
        origin_request = {
          connect_timeout = 30
          disable_chunked_encoding = false
          http_host_header = "api.scottpearson.net"
          keep_alive_connections = 100
          keep_alive_timeout = 90
          no_happy_eyeballs = false
          proxy_type = ""
          tcp_keep_alive = 30
        }
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

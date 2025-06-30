resource "cloudflare_spectrum_application" "ssh1_scottpearson_net" {
  zone_id = var.cloudflare_zone_id 
  protocol = "ssh"
  origin_direct = ["tcp://104.248.162.62:22"]
  ip_firewall = true
  proxy_protocol = "off"
  tls = "off"
  traffic_type = "direct"
  argo_smart_routing = true

  dns = {
    name = "ssh1.scottpearson.net"
    type = "CNAME"
  }
   
  edge_ips = {
    connectivity = "all"
    type = "dynamic"
  } 
}

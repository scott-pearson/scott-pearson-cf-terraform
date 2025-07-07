resource "cloudflare_load_balancer" "prod_lb" {
  zone_id = var.cloudflare_zone_id
  name = "lb.scottpearson.net" 
  description = "Production Load Balancer"
  default_pools = [cloudflare_load_balancer_pool.prod_lb_pool.id]
  fallback_pool = cloudflare_load_balancer_pool.prod_lb_pool.id
  proxied = true
  
  adaptive_routing = {
    failover_across_pools = false
  }
  
  location_strategy = {
    mode = "pop"
    prefer_ecs = "proximity"
  }
   
  random_steering = {
    default_weight = 1 
  }
  
  session_affinity = "none"
  session_affinity_attributes = {
    drain_duration = 0
    samesite = "Auto"
    secure = "Auto"
    zero_downtime_failover = "none"
  }
  
  steering_policy = "off"
}

resource "cloudflare_load_balancer_pool" "prod_lb_pool" {
  account_id = var.cloudflare_account_id
  name = "production"
  description = "production"
  enabled = true
  monitor = "f200caeafaa828d6a8ea2ed2df2d5440"
  minimum_origins = 1
  notification_email = "scott@cloudflare.com"

  check_regions = ["WEU"]

  origins = [
    {
    name = "scott-web01"
    address = "104.248.162.62"
    weight = 1
    enabled = true
    }
  ]

  origin_steering = {
    policy = "random"
  }
}

## bug in https://github.com/cloudflare/terraform-provider-cloudflare/issues/5676
#resource "cloudflare_load_balancer_monitor" "prod_lb_monitor" {
#  account_id = var.cloudflare_account_id
#  description = "production_healthcheck"
#  type = "https"
#  port = 443
#  method = "GET"
#  path = "/healthcheck.txt"
#  allow_insecure = false
#  expected_codes = "200"
#  follow_redirects = false
#  consecutive_down = 0
#  consecutive_up = 0
#
#  header = {
#    Host = ["scottpearson.net"]
#  }
#
#  interval = 60
#  retries = 2
#  timeout = 5
#}

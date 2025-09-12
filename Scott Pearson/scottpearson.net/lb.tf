resource "cloudflare_load_balancer" "prod_lb" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  name = "lb.scottpearson.net" 
  description = "Production Load Balancer"
  default_pools = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  fallback_pool = cloudflare_load_balancer_pool.prod_lb_pool.id
  proxied = true
  enabled = true
  
  adaptive_routing = {
    failover_across_pools = true
  }
  
  location_strategy = {
    mode = "resolver_ip"
    prefer_ecs = "always"
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
  
  steering_policy = "proximity"

  rules = [
    {
      name = "Conditional Routing (EU/AMER)"
      priority = 0
      disabled = false
      condition = "(any(http.request.headers[\"lb\"][*] in {\"eu\" \"amer\"}))"
      overrides = {
        default_pools = ["cd2e07b66c605c492d26acf62d2ebe00"]
      }
    },
    {
      name = "Conditional Routing (ROW)"
      priority = 10
      disabled = false
      condition = "(any(http.request.headers[\"lb\"][*] eq \"row\"))"
      overrides = {
        default_pools = ["b786c315262a2942e3bf47ba8c6a6b45"]
      }
    }
  ]

  # Custom rules do not work with geo routing so changing to proximity
  #region_pools = {
  #  EEU = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  #  WEU = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  #  ENAM = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  #  WNAM = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  #  NSAM = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  #  SSAM = [cloudflare_load_balancer_pool.prod_lb_pool.id, cloudflare_load_balancer_pool.row_prod_lb_pool.id]
  #  ME = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #  NAF = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #  NEAS = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #  OC = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #  SAF = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #  SAS = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #  SEAS = [cloudflare_load_balancer_pool.row_prod_lb_pool.id, cloudflare_load_balancer_pool.prod_lb_pool.id]
  #}
}

resource "cloudflare_load_balancer_pool" "prod_lb_pool" {
  account_id = var.cloudflare_account_id
  name = "eu-amer-production"
  description = "EU/AMER production pool"
  enabled = true
  monitor = cloudflare_load_balancer_monitor.prod_lb_monitor.id
  minimum_origins = 1
  notification_email = "scott@cloudflare.com"

  check_regions = ["WEU","EEU", "ENAM", "WNAM", "NSAM", "SSAM"]

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

  latitude = 51.5177
  longitude = -0.6215
}

resource "cloudflare_load_balancer_pool" "row_prod_lb_pool" {
  account_id = var.cloudflare_account_id
  name = "row-production"
  description = "Rest of world production pool"
  enabled = true
  monitor = cloudflare_load_balancer_monitor.prod_lb_monitor.id
  minimum_origins = 1
  notification_email = "scott@cloudflare.com"

  check_regions = ["ME", "NAF", "NEAS", "OC", "SAS", "SAF", "SEAS"]

  origins = [
    {
      name = "scott-web02"
      address = "209.38.29.196"
      weight = 1
      enabled = true
    }
  ]

  origin_steering = {
    policy = "random"
  }

  latitude = -33.8978
  longitude = 151.1899
}


## bug in https://github.com/cloudflare/terraform-provider-cloudflare/issues/5676
resource "cloudflare_load_balancer_monitor" "prod_lb_monitor" {
  account_id = var.cloudflare_account_id
  description = "production_healthcheck"
  type = "https"
  port = 443
  method = "GET"
  path = "/healthcheck.txt"
  allow_insecure = false
  expected_codes = "200"
  follow_redirects = false
  consecutive_down = 0
  consecutive_up = 0
  header = {
    Host = ["scottpearson.net"]
  }
  interval = 60
  retries = 2
  timeout = 5
  expected_body = "OK"
  probe_zone = "scottpearson.net"
}

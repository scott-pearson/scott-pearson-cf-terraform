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

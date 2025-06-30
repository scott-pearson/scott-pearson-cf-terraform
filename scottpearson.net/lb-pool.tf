resource "cloudflare_load_balancer_pool" "prod_lb_pool" {
  account_id = var.cloudflare_account_id
  name = "production"
  description = "production"
  enabled = true
  monitor = "f200caeafaa828d6a8ea2ed2df2d5440"
  minimum_origins = 1
  notification_email = "scott@cloudflare.com"
  
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

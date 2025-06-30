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

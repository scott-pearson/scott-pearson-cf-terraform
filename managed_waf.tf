resource "cloudflare_ruleset" "ruleset_managed_waf" {
  account_id  = var.cloudflare_account_id
  kind        = "root"
  name        = "root"
  phase       = "http_request_firewall_managed"

  rules = [
    {
      action = "skip"
      action_parameters = {
        ruleset = "current"
      }
      
      description = "Exception (Wordpress Upload)"
      enabled = true
      expression = "(http.request.uri.path eq \"/wp-admin/async-upload.php\" and http.cookie contains \"wordpress_logged_in\")"
      logging = {
        enabled = true
      }
    },    
    {
      action = "execute"
      action_parameters = {
        id = "efb7b8c949ac4650a09736fc376e9aee"
        matched_data = {
          public_key = var.firewallPubKey
        }
        overrides = {
          rules = [
            {
              enabled = true
              id = "8e361ee4328f4a3caf6caf3e664ed6fe"
            }
          ]
        }
      }

      description = "Cloudflare Managed"
      enabled = true
      expression = "true"
    },
    {
      action = "execute"
      action_parameters = {
        id = "4814384a9e5d4991b9815dcfc25d2f1f"
        matched_data = {
          public_key = var.firewallPubKey
        }
        overrides = {
          rules = [
            {
              id = "6179ae15870a4bb7b2d480d4843b323c"
              score_threshold = "40"
              action = "managed_challenge"
            }
          ]
          categories = [
            {
              category = "paranoia-level-2"
              enabled = false
            },
            {
              category = "paranoia-level-3"
              enabled = false
            },
            {  
              category = "paranoia-level-4"
              enabled = false
            }
          ]
        }
      }

      description = "OWASP"
      enabled = true
      expression = "true"
    }
  ]
}

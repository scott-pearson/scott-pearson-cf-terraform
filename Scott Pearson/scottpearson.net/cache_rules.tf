resource "cloudflare_ruleset" "cache_ruleset" {
  zone_id     = cloudflare_zone.scottpearson_net_zone.id 
  name        = "default"
  phase       = "http_request_cache_settings"
  kind        = "zone"
  description = ""
  rules = [
    {
      action            = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 86400,
          mode = "override_origin"
        }
        cache = true
        cache_key = {
          custom_key = {
            header = {
              contains = {
                lb = [
                  "eu",
                  "amer",
                  "row"
                ]
              }
            },
            user = {
              device_type = true,
              geo = true,
              lang = false
            }
          }
        }
        edge_ttl = {
          default = 86400
          mode = "override_origin"
          status_code_ttl = [
            {
              status_code_range = {
                from      = 500,
                to        = 599
              }
              value = -1
            },
            {
              status_code = 400,
              value       = -1
            },
            {
              status_code = 401,
              value       = -1
            },
            {
              status_code = 403,
              value       = -1
            },
            {
              status_code_range = {
                from      = 404,
                to        = 499
              }
              value = 3600
            },
            {
              status_code_range = {
                from     = 301,
                to       = 302
              }
              value = 60
            }
          ]
        }
        origin_cache_control = true
      }
      description       = "Cache Everything"
      expression        = true
      enabled           = true
      ref               = "cache_rule1"
    },
    {
      action            = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          default = 604800,
          mode = "override_origin"
        }
        cache = true
        cache_key = {
          custom_key = {
            header = {
              contains = {
                lb = [
                  "eu",
                  "amer",
                  "row"
                ]
              }
            },
            user = {
              device_type = true,
              geo = true,
              lang = false
            }
          }
        }
        edge_ttl = {
          default = 604800
          mode = "override_origin"
          status_code_ttl = [
            {
              status_code_range = {
                from      = 500,
                to        = 599
              }
              value = -1
            },
            {
              status_code = 400,
              value       = -1
            },
            {
              status_code = 401,
              value       = -1
            },
            {
              status_code = 403,
              value       = -1
            },
            {
              status_code_range = {
                from      = 404,
                to        = 499
              }
              value = 3600
            },
            {
              status_code_range = {
                from     = 301,
                to       = 302
              }
              value = 60
            }
          ]
        }
        origin_cache_control = true
      }
      description       = "Cache Default File Extensions"
      expression        = "(http.request.uri.path.extension in {\"7z\" \"avi\" \"avif\" \"apk\" \"bin\" \"bmp\" \"bz2\" \"class\" \"css\" \"csv\" \"doc\" \"docx\" \"dmg\" \"ejs\" \"eot\" \"eps\" \"exe\" \"flac\" \"gif\" \"gz\" \"ico\" \"iso\" \"jar\" \"jpg\" \"jpeg\" \"js\" \"mid\" \"midi\" \"mkv\" \"mp3\" \"mp4\" \"ogg\" \"otf\" \"pdf\" \"pict\" \"pls\" \"png\" \"ppt\" \"pptx\" \"ps\" \"rar\" \"svg\" \"svgz\" \"swf\" \"tar\" \"tif\" \"tiff\" \"ttf\" \"webm\" \"webp\" \"woff\" \"woff2\" \"xls\" \"xlsx\" \"zip\" \"zst\"})"
      enabled           = true
      ref               = "cache_rule2"
    },
    {
      action            = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          mode = "bypass"
        }
        cache = false
      }
      description       = "Bypass Cache For API"
      expression        = "(http.request.uri.path wildcard r\"/api/*\") or (http.host eq \"api.scottpearson.net\")"
      enabled           = true
      ref               = "cache_rule3"
    },
    {
      action            = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          mode = "bypass"
        }
        cache = false
      }
      description       = "Bypass Cache For Wordpress"
      expression        = "(http.request.uri.path wildcard r\"/wp-admin/*\") or (http.cookie contains \"wordpress_logged_in\")"      
      enabled           = true
      ref               = "cache_rule4"
    },
    {
      action            = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          mode = "bypass"
        }
        cache = false
      }
      description       = "Bypass Cache For Headers"
      expression        = "(http.request.uri.path eq \"/headers.php\")"      
      enabled           = true
      ref               = "cache_rule5"
    },
    {
      action            = "set_cache_settings"
      action_parameters = {
        browser_ttl = {
          mode = "bypass"
        }
        cache = false
      }
      description       = "Bypass Cache For Waiting Room"
      expression        = "(http.request.uri.path wildcard r\"/waitingroom/*\")"      
      enabled           = true
      ref               = "cache_rule6"
    }

  ]
}

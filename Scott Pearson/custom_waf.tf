resource "cloudflare_ruleset" "custom_waf_root" { 
  account_id = cloudflare_account.Scott_Pearson_account.id
  kind       = "root"
  name       = "default"
  phase      = "http_request_firewall_custom"
  
  rules = [
    {
      action      = "execute"
      description = "Account-Level Custom Rules"
      enabled     = true
      expression  = "(cf.zone.plan eq \"ENT\")"
      action_parameters = {
        id = cloudflare_ruleset.custom_waf.id
      }
    }
  ]
}

resource "cloudflare_ruleset" "custom_waf" {
  account_id  = cloudflare_account.Scott_Pearson_account.id
  kind        = "custom"
  name        = "default"
  phase       = "http_request_firewall_custom"

  rules = [
    {
      action = "skip"
      description = "Allow origin IPs to skip all security rules"
      expression = "(ip.src in $origin_ips)"
      enabled = true
      action_parameters = {
        phases = [
          "http_ratelimit",
          "http_request_firewall_managed"
        ],
        products = [
          "bic",
          "securityLevel"
        ]
        ruleset = "current"
      }
      logging = {
        enabled = true
      }
      ref = "origin_skip"
    },
    {
      action      = "log"
      description = "Log clients that failed JS detection"
      enabled     = true
      expression  = "(not cf.bot_management.js_detection.passed and not cf.bot_management.verified_bot)"
      ref         = "js_detections_rule"
    },
    {
      action      = "log"
      description = "Log login attempts/failures anomalys using account takeover detections ID"
      enabled     = true
      expression  = "(any(cf.bot_management.detection_ids[*] in {201326592 201326593}))"
      ref         = "takeover_detections_rule"
    },
    {
      action      = "log"
      description = "Log scrapers using scraping detections ID"
      enabled     = true
      expression  = "(any(cf.bot_management.detection_ids[*] in {50331648 50331649}) and not cf.bot_management.verified_bot)"
      ref         = "scraping_detections_rule"
    },
    {
      action      = "log"
      description = "Log clients that use proxies using residential proxy detections ID"
      enabled     = true
      expression  = "(any(cf.bot_management.detection_ids[*] eq 50331651) and not cf.bot_management.verified_bot)"
      ref         = "proxy_detections_rule"
    },
    {
      action = "block"
      description = "SIRT-1 Block Suspicious ASNs + JA4"
      expression = "(ip.src.asnum in $sus_asns and (cf.bot_management.ja4 in {\"\" \"t13d1012h1_18ef40b21276_6c9e902ecd13\" \"t13d1011h1_18ef40b21276_879711aa9f16\"} or any(cf.bot_management.detection_ids[*] eq 33554817)))"
      enabled = true
      ref = "bucklog_bad"
    },
    {
      action = "block"
      description = "SIRT-2 Block Empty UA"
      expression = "(any(cf.bot_management.detection_ids[*] eq 33554913))"
      enabled = true
      ref = "emptyua"
    },
    {
      action      = "block"
      description = "Block requests with malicious upload"
      enabled     = true
      expression  = "(cf.waf.content_scan.has_malicious_obj)"
      ref         = "malicious_upload_rule"
    },
    {
      action = "block"
      description = "Mitigate requests that have leaked credentials"
      expression = "(cf.waf.credential_check.username_and_password_leaked)"
      enabled = true
      ref = "leaked_creds"
    },
    {
      action = "block"
      description = "Mitigate definite attacks [1]"
      expression = "(cf.waf.score eq 1)"
      enabled = true
      ref = "def_attack"
    },
    {
      action = "block"
      description = "Mitigate definite bot traffic [1]"
      expression = "(cf.bot_management.score eq 1 and not cf.bot_management.verified_bot and not any(http.request.headers[\"scott-test\"][*] eq \"1\") and not (http.request.uri.path contains \"/.well-known/acme-challenge/\" and http.user_agent eq \"Mozilla/5.0 (compatible; Let's Encrypt validation server; +https://www.letsencrypt.org)\"))"
      enabled = true
      ref = "definite_bots"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely attacks [2-50]"
      expression = "(cf.waf.score gt 1 and cf.waf.score lt 50 and not cf.bot_management.js_detection.passed)"
      enabled = true
      ref = "likely_attack"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely bot traffic [2-10]"
      expression = "(cf.bot_management.score gt 1 and cf.bot_management.score lt 11 and not cf.bot_management.verified_bot and not any(http.request.headers[\"scott-test\"][*] eq \"1\") and not (http.request.uri.path contains \"/.well-known/acme-challenge/\" and http.user_agent eq \"Mozilla/5.0 (compatible; Let's Encrypt validation server; +https://www.letsencrypt.org)\"))"
      enabled = true
      ref = "likely_bots2"
    },
    {
      action = "managed_challenge"
      description = "Mitigate likely bot dynamic traffic [11-30]"
      expression = "(cf.bot_management.score gt 10 and cf.bot_management.score lt 31 and not cf.bot_management.verified_bot and not cf.bot_management.static_resource and not cf.bot_management.js_detection.passed and not (any(http.request.headers[\"scott-test\"][*] eq \"1\") or any(http.request.headers[\"cf-worker-zone\"][*] eq \"scottpearson.website\")) and not (http.request.uri.path contains \"/.well-known/acme-challenge/\" and http.user_agent eq \"Mozilla/5.0 (compatible; Let's Encrypt validation server; +https://www.letsencrypt.org)\"))"
      enabled = true
      ref = "likely_bots"
    }
  ]
}

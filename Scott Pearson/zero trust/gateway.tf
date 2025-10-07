resource "cloudflare_zero_trust_gateway_settings" "gw_settings" {
  account_id = var.cloudflare_account_id
  settings = {
    activity_log = {
      enabled    = true
    }
    antivirus = {
      enabled_download_phase = true
      enabled_upload_phase   = true
      fail_closed            = false
      notification_settings = {
        enabled = true
      }
    }
    block_page = {
      enabled          = true
      mode             = "redirect_uri"
      target_uri       = "https://scottpearson.net/errors/cf-403.html"
      include_context  = true
      footer_text      = ""
      header_text      = ""
      mailto_address   = ""
      mailto_subject   = ""
      logo_path        = ""
      background_color = ""
      name             = ""
      suppress_footer  = false
    }
    body_scanning = {
      inspection_mode = "deep"
    }
    browser_isolation = {
      non_identity_enabled = true
      url_browser_isolation_enabled = true
    }
    certificate = {
      id = cloudflare_zero_trust_gateway_certificate.gw_cert.id
    }
    extended_email_matching = {
      enabled = true
    }
    fips = {
      tls = true
    }
    host_selector = {
      enabled = true
    }
    inspection = {
      mode = "static"
    }
    protocol_detection = {
      enabled = true
    }
    tls_decrypt = {
      enabled = true
    }
  }
}

resource "cloudflare_zero_trust_gateway_logging" "gw_logging" {
  account_id = var.cloudflare_account_id
  redact_pii = false
  settings_by_rule_type = {
    dns = {
      log_all = true
      log_blocks = false
    }
    http = {
      log_all = true
      log_blocks = false
    }
    l4 = {
      log_all = true
      log_blocks = false
    }
  }
}

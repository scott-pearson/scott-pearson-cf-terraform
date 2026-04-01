resource "cloudflare_notification_policy" "aop_cert_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "zone_aop_custom_certificate_expiration_type"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Zone Level AOP Certificate Expiry"
  description = "This alert is for AOP cert expiry, upload a renewed certificate to use for zone-level AOP"
  filters = {}
}

resource "cloudflare_notification_policy" "bot_detection_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "bot_traffic_basic_alert"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Bot Detection Alert"
  description = "This alert is for bot detection, will trigger if a bot attack is detected"
  filters = {
    zones = tolist(var.cloudflare_zone_ids)
  }
}

resource "cloudflare_notification_policy" "incident_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "incident_alert"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Incident Notification"
  description = "This alert is for Cloudflare incidents"
  filters = {
    incident_impact = [
      "INCIDENT_IMPACT_MAJOR",
      "INCIDENT_IMPACT_CRITICAL"
    ]
  }
}

resource "cloudflare_notification_policy" "maintenance_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "maintenance_event_notification"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Maintenance Notification"
  description = "This alert is for Maintenance on Cloudflare POPs"
  filters = {}
}

resource "cloudflare_notification_policy" "l7_ddos_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "dos_attack_l7"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "HTTP DDoS Attack Alert"
  description = "This alert is for detection of a L7 HTTP DDOS attack against a domain"
  filters = {}
}

resource "cloudflare_notification_policy" "origin_error_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "http_alert_origin_error"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Origin Error Rate Alert"
  description = "This alert is for high levels of 5xx HTTP errors at origin"
  filters = {
    zones = ["9ead243424f613e0194590b375a3c9d2"],
    alert_trigger_preferences = ["slo"],
    slo = ["99.9"]
  }
}

resource "cloudflare_notification_policy" "traffic_anomalies_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "traffic_anomalies_alert"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Traffic Anomalies Alert"
  description = "This alert is for Traffic anomalies"
  filters = {
    zones = tolist(var.cloudflare_zone_ids),
    alert_trigger_preferences = ["zscore_spike_and_drop"]
  }
}

resource "cloudflare_notification_policy" "origin_monitoring_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "real_origin_monitoring"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Passive Origin Monitoring"
  description = "This alert is for when Cloudflare cannot reach the origin"
  filters = {}
}

resource "cloudflare_notification_policy" "security_events_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "clickhouse_alert_fw_anomaly"
  enabled = true
  mechanisms = {
    email = [
      {
        id = "scott@cloudflare.com"
      }
    ]
  }
  name = "Security Events Alert"
  description = "This alert is for spikes in security events"
  filters = {
    zones = tolist(var.cloudflare_zone_ids)
  }
}

resource "cloudflare_notification_policy" "new_malicious_host_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "scriptmonitor_alert_new_malicious_hosts"
  enabled    = true
  name       = "New Malicious Domain Alert"
  filters = {
    zones = tolist(var.cloudflare_zone_ids)
  }
  mechanisms = {
    email = [{
      id = "scott@cloudflare.com"
    }]
  }
}

resource "cloudflare_notification_policy" "new_malicious_script_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "scriptmonitor_alert_new_malicious_scripts"
  enabled    = true
  name       = "New Malicious Script Alert"
  filters = {
    zones = tolist(var.cloudflare_zone_ids)
  }
  mechanisms = {
    email = [{
      id = "scott@cloudflare.com"
    }]
  }
}

resource "cloudflare_notification_policy" "new_malicious_url_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "scriptmonitor_alert_new_malicious_url"
  enabled    = true
  name       = "New Malicious URL Alert"
  filters = {
    zones = tolist(var.cloudflare_zone_ids)
  }
  mechanisms = {
    email = [{
      id = "scott@cloudflare.com"
    }]
  }
}

resource "cloudflare_notification_policy" "security_insight_notification" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  alert_type = "security_insights_alert"
  enabled    = true
  name       = "New Security Insight"
  filters = {
    insight_class = ["no_challenge_ai_bots", "missing_auth_on_endpoint", "no_block_ai_bots", "update_bots_model", "manage_bot_fight_mode", "page_shield_not_enabled", "access_setup_incomplete", "a_record_dangling", "aaaa_record_dangling", "cname_record_dangling", "ddos_protection_not_in_force", "dmarc", "tls_not_enabled", "always_https_not_enabled", "hsts_not_enabled", "rdp_server_exposed", "page_shield_alerts_missing", "mixed_auth_on_endpoint", "increased_latency_on_endpoint", "response_size_anomaly_on_endpoint", "increased_error_rate_on_endpoint", "no_ip_list", "waf_not_enabled", "mr_log_mode", "managed_rules_old", "tls_version_old", "casb_findings", "api_endpoints_not_managed", "access_identity_provider_integration", "no_turnstile_enabled", "no_bot_score", "access_policy_insecure", "enumeration_on_endpoint", "parameter_pollution_on_endpoint", "no_clearance_cookie_rate_limit", "skip_above_threshold", "casb_unhealthy_integrations", "no_schema_on_endpoint", "security_txt_not_enabled", "sensitive_data_on_endpoint", "spf", "stale_bot_settings", "standard_super_bot_fight_mode", "tls_version", "bots_js_not_enabled", "tunnel_not_protected_by_access", "a_record_not_proxied", "aaaa_record_not_proxied", "cname_record_not_proxied", "upgrade_to_lcc", "mfa_not_enabled"]
  }
  mechanisms = {
    email = [{
      id = "scott@cloudflare.com"
    }]
  }
}

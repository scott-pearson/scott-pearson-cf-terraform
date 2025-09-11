resource "cloudflare_notification_policy" "aop_cert_notification" {
  account_id = var.cloudflare_account_id
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
  account_id = var.cloudflare_account_id
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
    zones = [var.cloudflare_zone_id]
  }
}

resource "cloudflare_notification_policy" "incident_notification" {
  account_id = var.cloudflare_account_id
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
  account_id = var.cloudflare_account_id
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
  account_id = var.cloudflare_account_id
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
  account_id = var.cloudflare_account_id
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
    zones = [var.cloudflare_zone_id],
    alert_trigger_preferences = ["slo"],
    slo = ["99.9"]
  }
}

resource "cloudflare_notification_policy" "traffic_anomalies_notification" {
  account_id = var.cloudflare_account_id
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
    zones = [var.cloudflare_zone_id],
    alert_trigger_preferences = ["zscore_spike_and_drop"]
  }
}

resource "cloudflare_notification_policy" "origin_monitoring_notification" {
  account_id = var.cloudflare_account_id
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
  account_id = var.cloudflare_account_id
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
    zones = [var.cloudflare_zone_id]
  }
}

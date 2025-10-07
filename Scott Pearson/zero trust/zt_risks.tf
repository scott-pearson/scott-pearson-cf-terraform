resource "cloudflare_zero_trust_risk_behavior" "risk_behaviour" {
  account_id = var.cloudflare_account_id
  behaviors = {
    imp_travel = {
      name        = "Impossible Travel"
      description = "A user had a successful Access application log in from two locations that they could not have traveled to in that period of time."
      risk_level  = "high"
      enabled = true
    },
    high_dlp = {
      name        = "High Number of DLP Policies Triggered"
      description = "User has triggered an active DLP profile in a Gateway policy fifteen times or more within one minute.",
      risk_level  = "medium"
      enabled     = false
    },
    sentinel_one = {
      name        = "SentinelOne Infection Detected"
      description = "User is signed in on a device where Sentinel One EDR detects an active threat or infection.",
      risk_level  = "medium"
      enabled = false
    }
  }
}

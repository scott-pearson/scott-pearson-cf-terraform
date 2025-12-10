data "cloudflare_zero_trust_gateway_categories_list" "categories" {
  account_id = var.cloudflare_account_id
}

data "cloudflare_zero_trust_gateway_app_types_list" "apps" {
  account_id = var.cloudflare_account_id
}

locals {
  main_categories_map = {
    for idx, c in data.cloudflare_zero_trust_gateway_categories_list.categories.result :
    c.name => c.id
  }

  app_types_map = merge([
    for c in data.cloudflare_zero_trust_gateway_app_types_list.apps.result :
    { (c.name) = c.id }
  ]...)

  subcategories_map = merge(flatten([
    for idx, c in data.cloudflare_zero_trust_gateway_categories_list.categories.result : {
      for k, v in coalesce(c.subcategories, []) :
      v.name => v.id
    }
  ])...)
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy1" {
  account_id    = var.cloudflare_account_id
  action        = "off"
  description   = "Bypass HTTPS decryption of Microsoft 365 traffic"
  enabled       = true
  filters       = ["http"]
  name          = "Do Not Inspect Microsoft 365"
  precedence    = 18000
  traffic       = "any(app.ids[*] in {${join(" ", [
    local.app_types_map["Microsoft Teams"],
    local.app_types_map["Microsoft Office365"],
    local.app_types_map["Microsoft Visual Studio"],
    local.app_types_map["Microsoft Azure"],
    local.app_types_map["Microsoft Power BI"],
    local.app_types_map["Microsoft OneDrive"],
    local.app_types_map["Microsoft Outlook"],
    local.app_types_map["Microsoft (Do Not Inspect)"]
  ])}})"
  rule_settings = {}
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy3" {
  account_id     = var.cloudflare_account_id
  action         = "allow"
  description    = "Allow Access to BBC website and Iplayer for Mac and scottkpearson1 email only"
  enabled        = true
  filters        = ["http"]
  name           = "Allow BBC (Mac OS/Email)"
  precedence     = 19000
  traffic        = "any(app.ids[*] in {${join(" ", [
    local.app_types_map["BBC iPlayer"],
    local.app_types_map["BBC"]
  ])}})"
  identity       = "identity.email == \"scottkpearson1@gmail.com\""
  device_posture = "any(device_posture.checks.passed[*] == \"${cloudflare_zero_trust_device_posture_rule.mac_os.id}\")" 
  rule_settings  = {
    untrusted_cert = {
      action = "error"
    }
  }
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy2" {
  account_id    = var.cloudflare_account_id
  action        = "block"
  description   = "Block Access to BBC website and Iplayer"
  enabled       = true
  filters       = ["http"]
  name          = "Block BBC"
  precedence    = 20000
  traffic       = "any(app.ids[*] in {${join(" ", [
    local.app_types_map["BBC iPlayer"],
    local.app_types_map["BBC"]
  ])}})"
  rule_settings = {}
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy7" {
  account_id    = var.cloudflare_account_id
  action        = "block"
  description   = "Block Access to Questionable Content and Security Risk Sites"
  enabled       = true
  filters       = ["http"]
  name          = "Block Security Risk Sites"
  precedence    = 24000
  traffic       = "any(http.request.uri.content_category[*] in {${join(" ", [
    local.main_categories_map["Questionable Content"],
    local.subcategories_map["Deceptive Ads"],
    local.subcategories_map["Drugs"],
    local.subcategories_map["Hacking"],
    local.subcategories_map["Militancy, Hate & Extremism"],
    local.subcategories_map["Profanity"],
    local.subcategories_map["Questionable Activities"],
    local.subcategories_map["School Cheating"],
    local.subcategories_map["Unreliable Information"],
    local.main_categories_map["Security Risks"],
    local.subcategories_map["New Domains"],
    local.subcategories_map["Newly Seen Domains"],
    local.subcategories_map["Parked & For Sale Domains"],
    local.main_categories_map["Miscellaneous"],
    local.subcategories_map["Login Screens"],
    local.subcategories_map["Miscellaneous"],
    local.subcategories_map["No Content"],
    local.subcategories_map["URL Alias/Redirect"],
    local.subcategories_map["Unreachable"],
    local.main_categories_map["Adult Themes"],
    local.subcategories_map["Adult Themes"],
    local.subcategories_map["Nudity"],
    local.subcategories_map["Pornography"],
    local.subcategories_map["Gambling"],
    local.subcategories_map["Artificial Intelligence"]
  ])}})"
  rule_settings = {}
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy4" {
  account_id    = var.cloudflare_account_id
  action        = "block"
  description   = "Block DNS for security threat domains"
  enabled       = true
  filters       = ["dns"]
  name          = "Block Security Threats (DNS)"
  precedence    = 21000
  traffic       = "any(dns.security_category[*] in {${join(" ", [
    local.subcategories_map["Anonymizer"],
    local.subcategories_map["Brand Embedding"],
    local.subcategories_map["Command and Control & Botnet"],
    local.subcategories_map["Compromised Domain"],
    local.subcategories_map["Cryptomining"],
    local.subcategories_map["DGA Domains"],
    local.subcategories_map["DNS Tunneling"],
    local.subcategories_map["Malware"],
    local.subcategories_map["Phishing"],
    local.subcategories_map["Potentially unwanted software"],
    local.subcategories_map["Private IP Address"],
    local.subcategories_map["Scam"],
    local.subcategories_map["Spam"],
    local.subcategories_map["Spyware"]
  ])}})"
  rule_settings = {}
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy5" {
  account_id    = var.cloudflare_account_id
  action        = "block"
  description   = "Block common content categories that may pose a risk"
  enabled       = false
  filters       = ["dns"]
  name          = "Block Bad Content (DNS)"
  precedence    = 22000
  traffic       = "any(dns.content_category[*] in {${join(" ", [
    local.main_categories_map["Questionable Content"],
    local.subcategories_map["Deceptive Ads"],
    local.subcategories_map["Drugs"],
    local.subcategories_map["Hacking"],
    local.subcategories_map["Militancy, Hate & Extremism"],
    local.subcategories_map["Profanity"],
    local.subcategories_map["Questionable Activities"],
    local.subcategories_map["School Cheating"],
    local.subcategories_map["Unreliable Information"],
    local.main_categories_map["Security Risks"],
    local.subcategories_map["New Domains"],
    local.subcategories_map["Newly Seen Domains"],
    local.subcategories_map["Parked & For Sale Domains"],
    local.main_categories_map["Miscellaneous"],
    local.subcategories_map["Login Screens"],
    local.subcategories_map["Miscellaneous"],
    local.subcategories_map["No Content"],
    local.subcategories_map["URL Alias/Redirect"],
    local.subcategories_map["Unreachable"],
    local.main_categories_map["Adult Themes"],
    local.subcategories_map["Adult Themes"],
    local.subcategories_map["Nudity"],
    local.subcategories_map["Pornography"],
    local.subcategories_map["Gambling"],
    local.subcategories_map["Artificial Intelligence"]
  ])}})"
  rule_settings = {}
}

resource "cloudflare_zero_trust_gateway_policy" "gw_policy6" {
  account_id    = var.cloudflare_account_id
  action        = "block"
  description   = "Block SSH at network level"
  enabled       = true
  filters       = ["l4"]
  name          = "Block SSH (L4)"
  precedence    = 23000
  traffic       = "net.detected_protocol == \"ssh\""
  rule_settings = {}
}

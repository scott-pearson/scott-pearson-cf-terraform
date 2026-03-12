resource "cloudflare_list" "origin_ip_list" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  kind = "ip"
  name = "origin_ips"
  description = "IPv4 and IPv6 list of origin IPs"
}

resource "cloudflare_list" "sus_asns_list" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  kind = "asn"
  name = "sus_asns"
  description = "Suspicious ASNs to be used in SIRT rules"
}

resource "cloudflare_list_item" "origin_ips" {
  for_each = var.origin_ips
  account_id = cloudflare_account.Scott_Pearson_account.id
  list_id = cloudflare_list.origin_ip_list.id
  ip = each.value
  comment = "Origin IP"
}

resource "cloudflare_list_item" "sus_asns" {
  for_each = toset([for asn in var.sus_asns : tostring(asn)])
  account_id = cloudflare_account.Scott_Pearson_account.id
  list_id = cloudflare_list.sus_asns_list.id
  asn = each.value
  comment = "Suspicious ASN"
}

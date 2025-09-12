resource "cloudflare_custom_pages" "waf_block" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  identifier = "waf_block"
  state = "customized"
  url = "https://scottpearson.net/errors/cf-403.html"
}

resource "cloudflare_custom_pages" "cf_500_errors" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  identifier = "500_errors"
  state = "customized"
  url = "https://scottpearson.net/errors/cf-5xx.html"
}

resource "cloudflare_custom_pages" "cf_1000_errors" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  identifier = "1000_errors"
  state = "customized"
  url = "https://scottpearson.net/errors/cf-1xxx.html"
}

resource "cloudflare_custom_pages" "managed_challenge" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  identifier = "managed_challenge"
  state = "customized"
  url = "https://scottpearson.net/errors/cf-503.html"
}

resource "cloudflare_custom_pages" "ratelimit_block" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  identifier = "ratelimit_block"
  state = "customized"
  url = "https://scottpearson.net/errors/cf-429.html"
}

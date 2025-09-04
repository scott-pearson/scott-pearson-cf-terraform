resource "cloudflare_snippet" "snippet_1" {
  zone_id  = var.cloudflare_zone_id
  snippet_name = "wafCustomPage"
  files = [
    {
      name    = "wafCustomPage.js"
      content = file("./snippets/wafCustomPage.js")
    }
  ]
  metadata = {
    main_module = "wafCustomPage.js"
  }
}

resource "cloudflare_snippet" "snippet_2" {
  zone_id  = var.cloudflare_zone_id
  snippet_name = "5xxCustomPage"
  files = [
    {
      name    = "5xxCustomPage.js"
      content = file("./snippets/5xxCustomPage.js")
    }
  ]
  metadata = {
    main_module = "5xxCustomPage.js"
  }
}

resource "cloudflare_snippet" "snippet_3" {
  zone_id  = var.cloudflare_zone_id
  snippet_name = "1xxxCustomPage"
  files = [
    {
      name    = "1xxxCustomPage.js"
      content = file("./snippets/1xxxCustomPage.js")
    }
  ]
  metadata = {
    main_module = "1xxxCustomPage.js"
  }
}

resource "cloudflare_snippet" "snippet_4" {
  zone_id  = var.cloudflare_zone_id
  snippet_name = "challengeCustomPage"
  files = [
    {
      name    = "challengeCustomPage.js"
      content = file("./snippets/challengeCustomPage.js")
    }
  ]
  metadata = {
    main_module = "challengeCustomPage.js"
  }
}

resource "cloudflare_snippet" "snippet_5" {
  zone_id  = var.cloudflare_zone_id
  snippet_name = "ratelimitCustomPage"
  files = [
    {
      name    = "ratelimitCustomPage.js"
      content = file("./snippets/ratelimitCustomPage.js")
    }
  ]
  metadata = {
    main_module = "ratelimitCustomPage.js"
  }
}

resource "cloudflare_snippet_rules" "snippet_rules" {
  zone_id  = var.cloudflare_zone_id
  rules = [
    {
      enabled = true
      expression = "(http.request.uri.path eq \"/errors/cf-403.html\")"
      description = "Custom error page for WAF 403 block"
      snippet_name = cloudflare_snippet.snippet_1.snippet_name
    },
    {
      enabled = true
      expression = "(http.request.uri.path eq \"/errors/cf-5xx.html\")"
      description = "Custom error page for 5xx errors"
      snippet_name = cloudflare_snippet.snippet_2.snippet_name
    },
    {
      enabled = true
      expression = "(http.request.uri.path eq \"/errors/cf-1xxx.html\")"
      description = "Custom error page for 1xxx errors"
      snippet_name = cloudflare_snippet.snippet_3.snippet_name
    },
    {
      enabled = true
      expression = "(http.request.uri.path eq \"/errors/cf-503.html\")"
      description = "Custom error page for WAF challenge"
      snippet_name = cloudflare_snippet.snippet_4.snippet_name
    },
    {
      enabled = true
      expression = "(http.request.uri.path eq \"/errors/cf-429.html\")"
      description = "Custom error page for Rate Limit block"
      snippet_name = cloudflare_snippet.snippet_5.snippet_name
    }
  ]
  depends_on = [
    cloudflare_snippet.snippet_1,
    cloudflare_snippet.snippet_2,
    cloudflare_snippet.snippet_3,
    cloudflare_snippet.snippet_4,
    cloudflare_snippet.snippet_5
  ]
}

resource "cloudflare_logpush_job" "http_logpush" {
  dataset          = "http_requests"
  destination_conf = "r2://cloudflare-managed-30db015b/{DATE}?access-key-id=${var.http_logpush_keyid}&secret-access-key=${var.http_logpush_secretaccesskey}&account-id=${var.cloudflare_account_id}"
  enabled          = true
  name             = "http-logs"
  zone_id          = cloudflare_zone.scottpearson_net_zone.id
  kind             = null
  max_upload_bytes = 10000000
  max_upload_records = 10000
  output_options = {
    field_names = [
                    "BotDetectionIDs",
                    "BotDetectionTags",
                    "BotScore",
                    "BotScoreSrc",
                    "BotTags",
                    "CacheCacheStatus",
                    "CacheReserveUsed",
                    "CacheResponseBytes",
                    "CacheResponseStatus",
                    "CacheTieredFill",
                    "ClientASN",
                    "ClientCity",
                    "ClientCountry",
                    "ClientDeviceType",
                    "ClientIP",
                    "ClientIPClass",
                    "ClientLatitude",
                    "ClientLongitude",
                    "ClientMTLSAuthCertFingerprint",
                    "ClientMTLSAuthStatus",
                    "ClientRegionCode",
                    "ClientRequestBytes",
                    "ClientRequestHost",
                    "ClientRequestMethod",
                    "ClientRequestPath",
                    "ClientRequestProtocol",
                    "ClientRequestReferer",
                    "ClientRequestScheme",
                    "ClientRequestSource",
                    "ClientRequestURI",
                    "ClientRequestUserAgent",
                    "ClientSSLCipher",
                    "ClientSSLProtocol",
                    "ClientSrcPort",
                    "ClientTCPRTTMs",
                    "ClientXRequestedWith",
                    "ContentScanObjResults",
                    "ContentScanObjSizes",
                    "ContentScanObjTypes",
                    "Cookies",
                    "EdgeCFConnectingO2O",
                    "EdgeColoCode",
                    "EdgeColoID",
                    "EdgeEndTimestamp",
                    "EdgePathingOp",
                    "EdgePathingSrc",
                    "EdgePathingStatus",
                    "EdgeRequestHost",
                    "EdgeResponseBodyBytes",
                    "EdgeResponseBytes",
                    "EdgeResponseCompressionRatio",
                    "EdgeResponseContentType",
                    "EdgeResponseStatus",
                    "EdgeServerIP",
                    "EdgeStartTimestamp",
                    "EdgeTimeToFirstByteMs",
                    "JA3Hash",
                    "JA4",
                    "JA4Signals",
                    "JSDetectionPassed",
                    "LeakedCredentialCheckResult",
                    "OriginDNSResponseTimeMs",
                    "OriginIP",
                    "OriginRequestHeaderSendDurationMs",
                    "OriginResponseBytes",
                    "OriginResponseDurationMs",
                    "OriginResponseHTTPExpires",
                    "OriginResponseHTTPLastModified",
                    "OriginResponseHeaderReceiveDurationMs",
                    "OriginResponseStatus",
                    "OriginResponseTime",
                    "OriginSSLProtocol",
                    "OriginTCPHandshakeDurationMs",
                    "OriginTLSHandshakeDurationMs",
                    "ParentRayID",
                    "RayID",
                    "RequestHeaders",
                    "ResponseHeaders",
                    "SecurityAction",
                    "SecurityActions",
                    "SecurityRuleDescription",
                    "SecurityRuleID",
                    "SecurityRuleIDs",
                    "SecuritySources",
                    "SmartRouteColoID",
                    "UpperTierColoID",
                    "VerifiedBotCategory",
                    "WAFAttackScore",
                    "WAFFlags",
                    "WAFMatchedVar",
                    "WAFRCEAttackScore",
                    "WAFSQLiAttackScore",
                    "WAFXSSAttackScore",
                    "WorkerCPUTime",
                    "WorkerScriptName",
                    "WorkerStatus",
                    "WorkerSubrequest",
                    "WorkerSubrequestCount",
                    "WorkerWallTimeUs",
                    "ZoneName"
    ]
    timestamp_format = "rfc3339"
    cve_2021_44228   = true
  }
}

resource "cloudflare_logpush_job" "firewall_logpush" {
  dataset          = "firewall_events"
  destination_conf = "r2://cloudflare-managed-6f6cf601/{DATE}?access-key-id=${var.http_logpush_keyid}&secret-access-key=${var.http_logpush_secretaccesskey}&account-id=${var.cloudflare_account_id}"
  enabled          = true
  name             = "firewall-events"
  zone_id          = cloudflare_zone.scottpearson_net_zone.id
  output_options = {
    field_names = [
                    "Action",
                    "ClientASN",
                    "ClientASNDescription",
                    "ClientCountry",
                    "ClientIP",
                    "ClientIPClass",
                    "ClientRefererHost",
                    "ClientRefererPath",
                    "ClientRefererQuery",
                    "ClientRefererScheme",
                    "ClientRequestHost",
                    "ClientRequestMethod",
                    "ClientRequestPath",
                    "ClientRequestProtocol",
                    "ClientRequestQuery",
                    "ClientRequestScheme",
                    "ClientRequestUserAgent",
                    "ContentScanObjResults",
                    "ContentScanObjSizes",
                    "ContentScanObjTypes",
                    "Datetime",
                    "Description",
                    "EdgeColoCode",
                    "EdgeResponseStatus",
                    "Kind",
                    "LeakedCredentialCheckResult",
                    "MatchIndex",
                    "Metadata",
                    "OriginResponseStatus",
                    "OriginatorRayID",
                    "RayID",
                    "Ref",
                    "RuleID",
                    "Source"
    ]
    timestamp_format = "rfc3339"
    cve_2021_44228   = true
  }
}

resource "cloudflare_ruleset" "custom_log_fields" {
  zone_id = cloudflare_zone.scottpearson_net_zone.id
  kind = "zone"
  name = "default"
  phase = "http_log_custom_fields"
  rules = [
    {
      action = "log_custom_field"
      action_parameters = {
        request_fields = [
          {
            name = "authorization"
          }
        ]
        transformed_request_fields = [
          {
            name = "cf-cert-revoked"
          },
          {
            name = "cf-cert-verified"
          },
          {
            name = "cf-cert-presented"
          },
          {
            name = "cf-cert-issuer-dn"
          },
          {
            name = "cf-worker"
          }
        ]
        response_fields = [
          {
            name = "cache-control"
          }
        ]
      }
      description = "Set Logpush custom fields for HTTP requests"
      enabled = true
      expression = "true"
    }
  ]
}

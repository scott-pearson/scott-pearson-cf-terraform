resource "cloudflare_account_token" "r2_account_token" {
  account_id = var.cloudflare_account_id
  name = "R2 Account Token"
  policies = [
    {
      effect = "allow"
      permission_groups = [
        {
          id = "d229766a2f7f4d299f20eaa8c9b1fde9"
          name = "Workers R2 Data Catalog Write"
        }, 
        {
          id = "bf7481a1826f439697cb59a20b22293e"
          name = "Workers R2 Storage Write"
        }
      ]
      resources = {
        "com.cloudflare.api.account.c375fad1094608dd251c2a7fdea837eb" = "*"
      }
    }
  ]
}

resource "cloudflare_account_token" "terraform_account_token" {
  account_id = var.cloudflare_account_id
  name = "Terraform token - Scott Pearson"
  policies = [
    {
      effect = "allow"
      permission_groups = [
        {
          id = "d229766a2f7f4d299f20eaa8c9b1fde9"
          name = "Workers R2 Data Catalog Write"
        }, 
        {
          id = "bf7481a1826f439697cb59a20b22293e"
          name = "Workers R2 Storage Write"
        }
      ]
      resources = {
        "com.cloudflare.api.account.c375fad1094608dd251c2a7fdea837eb" = "*"
      }
    },
    {
      effect = "allow"
      "permission_groups": [
        {
          id = 5af6a2f284144e95a89840408439adef
          name = "Firewall for AI Write"
        },
{
  id = 1ba6ab4cacdb454b913bbb93e1b8cb8c
  name = "AI Audit Write"
},
{
  id = c4df38be41c247b3b4b7702e76eadae0
  name = "Zone DNS Settings Write"
},
{
  id = eafd71286d0e4fdca404a7b4d203c5c9
  name = "Cloud Connector Write"
},
{
  id = 685f9605fd4e44ec937b6a0db658e629
  name = "Fraud Detection Write"
},
{
  id = 4bd3fb513a23494aa1341a7e1eb6e080
  name = "Response Compression Write"
},
{
  id = 2002629aaff0454085bf5a201ed70a72
  name = "Bot Management Feedback Report Write"
},
{
  id = dadeaf3abdf14126a77a35e0c92fc36e
  name = "Snippets Write"
},
{
  id = 2eee71c9364c4cacaf469e8370f09056
  name = "Email Security DMARC Reports Write"
},
{
  id = 87065285ab38463481e72815eefd18c3
  name = "Page Shield Write"
},
{
  id = c9915d86fbff46af9dd945c0a882294b
  name = "Zone Versioning Write"
},
{
  id = 9110d9dd749e464fb9f3961a2064efc5
  name = "Disable ESC Write"
},
{
  id = c244ec076974430a88bda1cdd992d0d9
  name = "Custom Pages Write"
},
{
  id = 06f0526e6e464647bd61b63c54935235
  name = "Config Settings Write"
},
{
  id = 74e1036f577a48528b78d2413b40538d
  name = "Dynamic URL Redirects Write"
},
{
  id = f0235726de25444a84f704b7c93afadf
  name = "Domain API Gateway"
},
{
  id = 9ff81cbbe65c400b97d92c3c1033cab6
  name = "Cache Settings Write"
},
{
  id = a9dba34cf5814d4ab2007b4ada0045bd
  name = "Custom Errors Write"
},
{
  id = cdeb15b336e640a2965df8c65052f1e0
  name = "Zaraz Admin"
},
{
  id = 79b3ec0d10ce4148a8f8bdc0cc5f97f2
  name = "Email Routing Rules Write"
},
{
  id = a4308c6855c84eb2873e01b6cc85cbb3
  name = "Origin Write"
},
{
  id = 0fd9d56bc2da43ad8ea22d610dd8cab1
  name = "Managed headers Write"
},
{
  id = 5ea6da42edb34811a78d1b007557c0ca
  name = "Web3 Hostnames Write"
},
{
  id = 0ac90a90249747bca6b047d97f0803e9
  name = "Zone Transform Rules Write"
},
{
  id = b88a3aa889474524bccea5cf18f122bf
  name = "HTTP DDoS Managed Ruleset Write"
},
{
  id = 89bb8c37d46042e98b84560eaaa6379f
  name = "Sanitize Write"
},
{
  id = 3b94c49258ec4573b06d51d99b6416c0
  name = "Bot Management Write"
},
{
  id = fb6778dc191143babbfaa57993f1d275
  name = "Zone WAF Write"
},
{
  id = e0dc25a0fbdf4286b1ea100e3256b0e3
  name = "Health Checks Write"
},
{
  id = 24fc124dc8254e0db468e60bf410c800
  name = "Waiting Rooms Write"
},
{
  id = 959972745952452f8be2452be8cbb9f2
  name = "Access: Apps and Policies Write"
},
{
  id = 3030687196b94b638145a3953da2b699
  name = "Zone Settings Write"
},
{
  id = e6d2666161e84845a636613608cee8d5
  name = "Zone Write"
},
{
  id = 28f4b596e7d643029c524985477ae49a
  name = "Workers Routes Write"
},
{
  id = c03055bc037c4ea9afb9a9f104b7b721
  name = "SSL and Certificates Write"
},
{
  id = 3e0b5820118e47f3922f7c989e673882
  name = "Logs Write"
},
{
  id = ed07f6c337da4195b4e72a1fb2c6bcae
  name = "Page Rules Write"
},
{
  id = 6d7f2f5f5b1d4a0e9081fdc98d432fd1
  name = "Load Balancers Write"
},
{
  id = 43137f8d07884d3198dc0ee77ca6e79b
  name = "Firewall Services Write"
},
{
  id = 4755a26eedb94da69e1066d98aa820be
  name = "DNS Write"
} 
  ]
}

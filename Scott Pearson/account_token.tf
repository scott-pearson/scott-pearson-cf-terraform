resource "cloudflare_account_token" "r2_account_token" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  name = "R2 Account Token"
  policies = [
    {
      effect = "allow"
      resources = {
        "com.cloudflare.api.account.${cloudflare_account.Scott_Pearson_account.id}" = "*"
      }
      permission_groups = [
        {
          id = "f45430d92e2b4a6cb9f94f2594c141b8"
          #name = "Workers R2 Data Catalog SQL Read"
        },
        {
          id = "d229766a2f7f4d299f20eaa8c9b1fde9"
          #name = "Workers R2 Data Catalog Write"
        },
        {
          id = "bf7481a1826f439697cb59a20b22293e"
          #name = "Workers R2 Storage Write"
        }
      ]
    }
  ]
}

resource "cloudflare_account_token" "terraform_token" {
  account_id = cloudflare_account.Scott_Pearson_account.id
  name = "Terraform Account Token"
  policies = [
    {
      effect = "allow"
      resources = {
        "com.cloudflare.api.account.${cloudflare_account.Scott_Pearson_account.id}" = "*"
      }
      permission_groups = [
        {
          id = "5bc3f8b21c554832afc660159ab75fa4"
          #name = "Account API Tokens Write"
        },
        {
          id = "8a9d35a7c8504208ad5c3e8d58e6162d"
          #name = "Account Custom Pages Write"
        },
        {
          id = "56907406c3d548ed902070ec4df0e328"
          #name = "Account Rulesets Write"
        },
        {
          id = "1af1fa2adc104452b74a9a3364202f20"
          #name = "Account Settings Write"
        },
        {
          id = "db37e5f1cb1a4e1aabaef8deaea43575"
          #name = "Account: SSL and Certificates Write"
        },
        {
          id = "cde8c82463b6414ca06e46b9633f52a6"
          #name = "Account WAF Write"
        },
        {
          id = "abe78e2276664f4db588c1f675a77486"
          #name = "Mass URL Redirects Write"
        },
        {
          id = "8d28297797f24fb8a0c332fe0866ec89"
          #name = "Pages Write"
        },
        {
          id = "c07321b023e944ff818fec44d8203567"
          #name = "Cloudflare Tunnel Write"
        },
        {
          id = "d44ed14bcc4340b194d3824d60edad3f"
          #name = "DDoS Protection Write"
        },
        {
          id = "d2a1802cc9a34e30852f8b33869b2f3c"
          #name = "Load Balancing: Monitors and Pools Write"
        },
        {  
          id = "96163bd1b0784f62b3e44ed8c2ab1eb6"
          #name = "Logs Write"
        },
        {
          id = "c3c847c5802d4ce3ba00e3e97b3c8555"
          #name = "Notifications Write"
        },
        {
          id = "ae16e88bc7814753a1894c7ce187ab72"
          #name = "Transform Rules Write"
        },
        {
          id = "e086da7e2179491d91ee5f35b3ca210a"
          #name = "Workers Scripts Write"
        }
      ]
    },
    {
      effect = "allow"
      resources = {
        "com.cloudflare.api.account.${cloudflare_account.Scott_Pearson_account.id}" = "*" 
      }
      permission_groups = [
        {
          id = "3030687196b94b638145a3953da2b699"
          #name = "Zone Settings Write"
        },
        {
          id = "c03055bc037c4ea9afb9a9f104b7b721"
          #name = "SSL and Certificates Write"
        },
        {
          id = "e6d2666161e84845a636613608cee8d5"
          #name = "Zone Write"
        }
      ]
    }
  ]
}

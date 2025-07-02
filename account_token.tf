resource "cloudflare_account_token" "r2_account_token" {
  account_id = var.cloudflare_account_id
  name = "R2 Account Token"
  policies = [
    {
      effect = "allow"
      permission_groups = [
        {
          id = "d229766a2f7f4d299f20eaa8c9b1fde9"
          #name = "Workers R2 Data Catalog Write"
        }, 
        {
          id = "bf7481a1826f439697cb59a20b22293e"
          #name = "Workers R2 Storage Write"
        }
      ]
      resources = {
        "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
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
          #name = "Workers R2 Data Catalog Write"
        }, 
        {
          id = "bf7481a1826f439697cb59a20b22293e"
          #name = "Workers R2 Storage Write"
        }
      ]
      resources = {
        "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
      }
    },
    {
      effect = "allow"
      resources = {
        "com.cloudflare.api.account.zone.${var.cloudflare_zone_id}" = "*"
      }
      permission_groups = [
        {
          id = "5af6a2f284144e95a89840408439adef"
          #name = "Firewall for AI Write"
        },
			  {
			    id = "1ba6ab4cacdb454b913bbb93e1b8cb8c"
          #name = "AI Audit Write"
        },
        {
          id = "c4df38be41c247b3b4b7702e76eadae0"
          #name = "Zone DNS Settings Write"
        },
        {
          id = "eafd71286d0e4fdca404a7b4d203c5c9"
          #name = "Cloud Connector Write"
        },
        {
          id = "685f9605fd4e44ec937b6a0db658e629"
          #name = "Fraud Detection Write"
        },
        {
	        id = "4bd3fb513a23494aa1341a7e1eb6e080"
	        #name = "Response Compression Write"
        },
        {
	        id = "2002629aaff0454085bf5a201ed70a72"
	        #name = "Bot Management Feedback Report Write"
        },
        {
	        id = "dadeaf3abdf14126a77a35e0c92fc36e"
	        #name = "Snippets Write"
			  },
			  {
				  id = "2eee71c9364c4cacaf469e8370f09056"
				  #name = "Email Security DMARC Reports Write"
        },
        {
			    id = "87065285ab38463481e72815eefd18c3"
			    #name = "Page Shield Write"
			  },
			  {
          id = "c9915d86fbff46af9dd945c0a882294b"
          #name = "Zone Versioning Write"
        },
        {
          id = "9110d9dd749e464fb9f3961a2064efc5"
          #name = "Disable ESC Write"
        },
        {
          id = "c244ec076974430a88bda1cdd992d0d9"
          #name = "Custom Pages Write"
        },
        {
          id = "06f0526e6e464647bd61b63c54935235"
          #name = "Config Settings Write"
        },
        {
          id = "74e1036f577a48528b78d2413b40538d"
          #name = "Dynamic URL Redirects Write"
        },
        {
          id = "f0235726de25444a84f704b7c93afadf"
          #name = "Domain API Gateway"
        },
        {
          id = "9ff81cbbe65c400b97d92c3c1033cab6"
          #name = "Cache Settings Write"
        },
        {
          id = "a9dba34cf5814d4ab2007b4ada0045bd"
          #name = "Custom Errors Write"
        },
        {
          id = "cdeb15b336e640a2965df8c65052f1e0"
          #name = "Zaraz Admin"
        },
        {
          id = "79b3ec0d10ce4148a8f8bdc0cc5f97f2"
          #name = "Email Routing Rules Write"
        },
        {
          id = "a4308c6855c84eb2873e01b6cc85cbb3"
          #name = "Origin Write"
        },
        {
          id = "0fd9d56bc2da43ad8ea22d610dd8cab1"
          #name = "Managed headers Write"
        },
        {
          id = "5ea6da42edb34811a78d1b007557c0ca"
          #name = "Web3 Host#names Write"
        },
        {
          id = "0ac90a90249747bca6b047d97f0803e9"
          #name = "Zone Transform Rules Write"
        },
        {
          id = "b88a3aa889474524bccea5cf18f122bf"
          #name = "HTTP DDoS Managed Ruleset Write"
        },
        {
          id = "89bb8c37d46042e98b84560eaaa6379f"
          #name = "Sanitize Write"
        },
        {
          id = "3b94c49258ec4573b06d51d99b6416c0"
          #name = "Bot Management Write"
        },
			  {
			    id = "fb6778dc191143babbfaa57993f1d275"
			    #name = "Zone WAF Write"
			  },
			  {
			    id = "e0dc25a0fbdf4286b1ea100e3256b0e3"
			    #name = "Health Checks Write"
			  },
			  {
			    id = "24fc124dc8254e0db468e60bf410c800"
			    #name = "Waiting Rooms Write"
			  },
			  {
			    id = "959972745952452f8be2452be8cbb9f2"
			    #name = "Access: Apps and Policies Write"
			  },
			  {
			    id = "3030687196b94b638145a3953da2b699"
			    #name = "Zone Settings Write"
			  },
			  {
			    id = "e6d2666161e84845a636613608cee8d5"
			    #name = "Zone Write"
			  },
			  {
			    id = "28f4b596e7d643029c524985477ae49a"
			    #name = "Workers Routes Write"
			  },
			  {
			    id = "c03055bc037c4ea9afb9a9f104b7b721"
			    #name = "SSL and Certificates Write"
			  },
			  {
			    id = "3e0b5820118e47f3922f7c989e673882"
			    #name = "Logs Write"
			  },
			  {
			    id = "ed07f6c337da4195b4e72a1fb2c6bcae"
			    #name = "Page Rules Write"
			  },
			  {
			    id = "6d7f2f5f5b1d4a0e9081fdc98d432fd1"
			    #name = "Load Balancers Write"
			  },
			  {
			    id = "43137f8d07884d3198dc0ee77ca6e79b"
			    #name = "Firewall Services Write"
			  },
			  {
			    id = "4755a26eedb94da69e1066d98aa820be"
			    #name = "DNS Write"
			  } 
		  ]
		},
		{
		  effect = "allow"
	    resources = {
	      "com.cloudflare.api.account.${var.cloudflare_account_id}": "*"
	    }
	    permission_groups = [
		    {
		      id = "e84fd345697c4036a14e7810da036e1a"
		      #name = "Agents Gateway Write"
		    },
		    {
		      id = "bdbcd690c763475a985e8641dddc09f7"
		      #name = "Workers Containers Write"
		    },
		    {
		      id = "82c075da3f4647a2a03becd0fe240f8a"
		      #name = "Workers Observability Write"
		    },
		    {
		      id = "cc00ebddebca4b8399607562a78df084"
		      #name = "Zero Trust Resilience Write"
		    },
		    {
		      id = "adc8fa2bc6124928a8b3314dc63a1235"
		      #name = "Secrets Store Write"
		    },
		    {
		      id = "a1a7389ba7e441dba95852e10970fcc3"
		      #name = "Magic WAN Write"
		    },
		    {
		      id = "7fb8d27511b34d02994d005b520b679f"
		      #name = "Auto Rag Write"
		    },
		    {
		      id = "120f843a9c074f399b830e542e5616b8"
		      #name = "Trust and Safety Write"
		    },
		    {
		      id = "adddda876faa4a0590f1b23a038976e4"
		      #name = "Browser Rendering Write"
		    },
		    {
		      id = "5b7aedd821a548b9bf5a2acabbce98c7"
		      #name = "DNS View Write"
		    },
		    {
		      id = "419ec42810af4659ade77716dbe47bc6"
		      #name = "Load Balancers Account Write"
		    },
		    {
		      id = "9bf884ba0de445dab37ea4a3e1a2c9f1"
		      #name = "Cloudflare CDS Compute Account Write"
		    },
		    {
		      id = "dc44f27f48ab405392a5f69fe822bd01"
		      #name = "Account DNS Settings Write"
		    },
		    {
		      id = "2e095cf436e2455fa62c9a9c2e18c478"
		      #name = "Workers CI Write"
		    },
		    {
		      id = "e34111af393449539859485aa5ddd5bd"
		      #name = "Pipelines Write"
		    },
		    {
		      id = "677767156f294485b497a8f103172e7d"
		      #name = "Cloudforce One Write"
		    },
		    {
		      id = "a3567c13e074447fb101babac3463566"
		      #name = "Cloud Email Security: Write"
		    },
		    {
		      id = "6c8a3737f07f46369c1ea1f22138daaf"
		      #name = "AI Gateway Write"
		    },
		    {
		      id = "0caa90c9b186447397c8b00358d34a76"
		      #name = "DDoS Botnet Feed Write"
		    },
		    {
		      id = "bacc64e0f6c34fc0883a1223f938a104"
		      #name = "Workers AI Write"
		    },
		    {
		      id = "366f57075ffc42689627bcf8242a1b6d"
		      #name = "Queues Write"
		    },
		    {
		      id = "b711942448db4b0aace44d1312f9fdb0"
		      #name = "Calls Write"
		    },
		    {
		      id = "6ffe7f4299db4d4cb54f64e0eb12a456"
		      #name = "Address Maps Write"
		    },
		    {
		      id = "64156ba5be47441096c83c7fc17c488b"
		      #name = "Vectorize Write"
		    },
		    {
		      id = "e2980d9241cf4939bbbd74fdc43b9651"
		      #name = "Cloudflare One Networks Write"
		    },
		    {
		      id = "a7030c9c98d544e092d8b099fabb1f06"
		      #name = "Cloudflare One Connectors Write"
		    },
		    {
		      id = "5b5c774a5d174ca88d046c8889648b3f"
		      #name = "Cloudflare One Connector: WARP Write"
		    },
		    {
		      id = "037b9e348b3b42d4b46ea2fcb1cfb3e7"
		      #name = "Cloudflare One Connector: cloudflared Write"
		    },
		    {
		      id = "721b2f51fba74871bd361de65aeb7e03"
		      #name = "Hyperdrive Write"
		    },
		    {
		      id = "26ce6c7d18a346528e7b905d5e269866"
		      #name = "Cloudchamber Write"
		    },
		    {
		      id = "5e5d3e8efeec49f3afb67bafecbcd511"
		      #name = "Account API Gateway"
		    },
		    {
		      id = "c3c847c5802d4ce3ba00e3e97b3c8555"
		      #name = "Notifications Write"
		    },
		    {
		      id = "2a400bcb29154daab509fe07e3facab0"
		      #name = "URL Scanner Write"
		    },
		    {
		      id = "d30c9ad8b5224e7cb8d41bcb4757effc"
		      #name = "Access: SSH Auditing Write"
		    },
		    {
		      id = "4e5fd8ac327b4a358e48c66fcbeb856d"
		      #name = "Access: Custom Pages Write"
		    },
		    {
		      id = "7c81856725af47ce89a790d5fb36f362"
		      #name = "Constellation Write"
		    },
		    {
		      id = "92c8dcd551cc42a6a57a54e8f8d3f3e3"
		      #name = "Cloudflare DEX Write"
		    },
		    {
		      id = "865ebd55bc6d4b109de6813eccfefd13"
		      #name = "IOT Write"
		    },
		    {
		      id = "db37e5f1cb1a4e1aabaef8deaea43575"
		      #name = "Account: SSL and Certificates Write"
		    },
		    {
		      id = "18555e39c5ba40d284dde87eda845a90"
		      #name = "Disable ESC Write"
		    },
		    {
		      id = "8a9d35a7c8504208ad5c3e8d58e6162d"
		      #name = "Account Custom Pages Write"
		    },
		    {
		      id = "09c77baecb6341a2b1ca2c62b658d290"
		      #name = "Magic Network Monitoring Config Write"
		    },
		    {
		      id = "4736c02a9f224c8196ae5b127beae78c"
		      #name = "HTTP Applications Write"
		    },
		    {
		      id = "c6f6338ceae545d0b90daaa1fed855e6"
		      #name = "China Network Steering Write"
		    },
		    {
		      id = "09b2857d1c31407795e75e3fed8617a1"
		      #name = "D1 Write"
		    },
		    {
		      id = "92209474242d459690e2cdb1985eaa6c"
		      #name = "Intel Write"
		    },
		    {
		      id = "910b6ecca1c5411bb894e787362d1312"
		      #name = "Pubsub Configuration Write"
		    },
		    {
		      id = "755c05aa014b4f9ab263aa80b8167bd8"
		      #name = "Turnstile Sites Write"
		    },
		    {
		      id = "e4589eb09e63436686cd64252a3aebeb"
		      #name = "Email Routing Addresses Write"
		    },
		    {
		      id = "8d28297797f24fb8a0c332fe0866ec89"
		      #name = "Pages Write"
		    },
		    {
		      id = "abe78e2276664f4db588c1f675a77486"
		      #name = "Mass URL Redirects Write"
		    },
		    {
		      id = "8bd1dac84d3d43e7bfb43145f010a15c"
		      #name = "Magic Firewall Write"
		    },
		    {
		      id = "7a4c3574054a4d0ba7c692893ba8bdd4"
		      #name = "L4 DDoS Managed Ruleset Write"
		    },
		    {
		      id = "ae16e88bc7814753a1894c7ce187ab72"
		      #name = "Transform Rules Write"
		    },
		    {
		      id = "235eac9bb64942b49cb805cc851cb000"
		      #name = "Select Configuration Write"
		    },
		    {
		      id = "cde8c82463b6414ca06e46b9633f52a6"
		      #name = "Account WAF Write"
		    },
		    {
		      id = "4ea7d6421801452dbf07cef853a5ef39"
		      #name = "Magic Firewall Packet Captures - Write PCAPs API"
		    },
		    {
		      id = "0bc09a3cd4b54605990df4e307f138e1"
		      #name = "Magic Transit Write"
		    },
		    {
		      id = "618ec6c64a3a42f8b08bdcb147ded4e4"
		      #name = "Images Write"
		    },
		    {
		      id = "d44ed14bcc4340b194d3824d60edad3f"
		      #name = "DDoS Protection Write"
		    },
		    {
		      id = "56907406c3d548ed902070ec4df0e328"
		      #name = "Account Rulesets Write"
		    },
		    {
		      id = "92b8234e99f64e05bbbc59e1dc0f76b6"
		      #name = "IP Prefixes: Write"
		    },
		    {
		      id = "c07321b023e944ff818fec44d8203567"
		      #name = "Cloudflare Tunnel Write"
		    },
		    {
		      id = "29d3afbfd4054af9accdd1118815ed05"
		      #name = "Access: Mutual TLS Certificates Write"
		    },
		    {
		      id = "2fc1072ee6b743828db668fcb3f9dee7"
		      #name = "Access: Device Posture Write"
		    },
		    {
		      id = "a1c0fec57cf94af79479a6d827fa518c"
		      #name = "Access: Service Tokens Write"
		    },
		    {
		      id = "96163bd1b0784f62b3e44ed8c2ab1eb6"
		      #name = "Logs Write"
		    },
		    {
		      id = "61ddc58f1da14f95b33b41213360cbeb"
		      #name = "Rule Policies Write"
		    },
		    {
		      id = "2edbf20661fd4661b0fe10e9e12f485c"
		      #name = "Account Rule Lists Write"
		    },
		    {
		      id = "2ae23e4939d54074b7d252d27ce75a77"
		      #name = "IP Prefixes: BGP On Demand Write"
		    },
		    {
		      id = "b33f02c6f7284e05a6f20741c0bb0567"
		      #name = "Zero Trust Write"
		    },
		    {
		      id = "bfe0d8686a584fa680f4c53b5eb0de6d"
		      #name = "Access: Organizations, Identity Providers, and Groups Write"
		    },
		    {
		      id = "f7f0eda5697f475c90846e879bab8666"
		      #name = "Workers KV Storage Write"
		    },
		    {
		      id = "e086da7e2179491d91ee5f35b3ca210a"
		      #name = "Workers Scripts Write"
		    },
		    {
		      id = "d2a1802cc9a34e30852f8b33869b2f3c"
		      #name = "Load Balancing: Monitors and Pools Write"
		    },
		    {
		      id = "a416acf9ef5a4af19fb11ed3b96b1fe6"
		      #name = "Account Firewall Access Rules Write"
		    },
		    {
		      id = "da6d2d6f2ec8442eaadda60d13f42bca"
		      #name = "DNS Firewall Write"
		    },
		    {
		      id = "714f9c13a5684c2885a793f5edb36f59"
		      #name = "Stream Write"
		    },
		    {
		      id = "6c80e02421494afc9ae14414ed442632"
		      #name = "Billing Write"
		    },
		    {
		      id = "1af1fa2adc104452b74a9a3364202f20"
		      #name = "Account Settings Write"
		    },
		    {
		      id = "1e13c5124ca64b72b1969a67e8829049"
		      #name = "Access: Apps and Policies Write"
		    }
		  ]
		}
  ]
}

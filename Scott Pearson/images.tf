# Bug with this - https://github.com/cloudflare/terraform-provider-cloudflare/issues/6176
#resource "cloudflare_image" "logo" {
#  account_id = cloudflare_account.Scott_Pearson_account.id  
#  id = "logo"
#  creator = "Scott"
#  file = filebase64("./images/logo.jpg")
#  metadata = jsonencode({
#    source = "terraform"
#    env    = "production"
#  })
#  require_signed_urls = false
#}

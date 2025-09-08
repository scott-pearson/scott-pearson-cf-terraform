## Currently there is a bug with this https://github.com/cloudflare/terraform-provider-cloudflare/issues/5700

resource "cloudflare_account_member" "grayfox0014-gmail-com" {
  account_id = var.cloudflare_account_id
  email = "grayfox0014@gmail.com"
  roles = ["33666b9c79b9a5273fc7344ff42f953d"]
  status = "accepted"
}

resource "cloudflare_account_member" "scott-cloudflare-com" {
  account_id = var.cloudflare_account_id
  email = "scott@cloudflare.com" 
  roles = ["33666b9c79b9a5273fc7344ff42f953d"]
  status = "accepted"
}

resource "cloudflare_account_member" "mbamps-cloudflare-com" {
  account_id = var.cloudflare_account_id
  email = "mbamps@cloudflare.com"
  roles = ["05784afa30c1afe1440e79d9351c7430"]
  status = "accepted"
}

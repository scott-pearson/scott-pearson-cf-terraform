# Bug with this https://github.com/cloudflare/terraform-provider-cloudflare/issues/5893 will always try and change description
resource "cloudflare_zero_trust_device_posture_rule" "gateway" {
  account_id = var.cloudflare_account_id
  name       = "gateway"
  type       = "gateway"
}

resource "cloudflare_zero_trust_device_posture_rule" "ubuntu_os" {
  account_id         = var.cloudflare_account_id
  name               = "Ubuntu 24.04"
  type               = "os_version"
  input              = {
    operator           = ">="
    os_distro_name     = "ubuntu"
    os_distro_revision = "24.04"
    version            = "6.14.0"
  }
  match              = [
    {
      platform = "linux"
    }
  ]
  schedule           = "5m"
}

resource "cloudflare_zero_trust_device_posture_rule" "mac_os" {
  account_id         = var.cloudflare_account_id
  name               = "Mac 15.0"
  type               = "os_version"
  input              = {
    operator           = ">="
    version            = "15.0.0"
  }
  match              = [
    {
      platform = "mac"
    }
  ]
  schedule           = "5m"
}

resource "cloudflare_zero_trust_device_posture_rule" "samsung_os" {
  account_id         = var.cloudflare_account_id
  name               = "Android 16.0"
  type               = "os_version"
  input              = {
    operator           = ">="
    version            = "16.0.0"
  }
  match              = [
    {
      platform = "android"
    }
  ]
  schedule           = "5m"
}

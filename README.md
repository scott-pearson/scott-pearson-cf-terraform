# Cloudflare Terraform Account and Zone Configurations

This repository manages Cloudflare account and zone-level configurations using Terraform.

## Features

- Centralized management of Cloudflare account-level settings.
- Configuration of Cloudflare zone settings (e.g., SSL/TLS, caching, security).
- Management of Cloudflare DNS records, WAF rules, and more.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0 or higher recommended)
- A Cloudflare account with an API Token that has appropriate permissions to manage zones and accounts.

## Setup

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/scott-pearson-cf-terraform.git
    cd scott-pearson-cf-terraform
    ```

2.  **Configure Cloudflare API Token:**

    Set your Cloudflare API Token as an environment variable. Replace `YOUR_CLOUDFLARE_API_TOKEN` with your actual token.

    ```bash
    export CLOUDFLARE_API_TOKEN="YOUR_CLOUDFLARE_API_TOKEN"
    ```

    Alternatively, you can configure the provider directly in your `.tf` files, but using environment variables is recommended for security.

    ```terraform
    provider "cloudflare" {
      api_token = var.cloudflare_api_token
    }
    ```

3.  **Initialize Terraform:**

    ```bash
    terraform init
    ```

## Usage

1.  **Review the plan:**

    ```bash
    terraform plan
    ```

    This command shows you what actions Terraform will take without actually making any changes.

2.  **Apply the configurations:**

    ```bash
    terraform apply
    ```

    Terraform will prompt you to confirm the actions before applying them.

## Repository Structure

The repository is organized into two main sections:

### Account-Level Configurations

These files manage account-wide settings and are located in the root directory.

```
.
├── account.tf
├── account_dns_settings.tf
├── account_notification.tf
├── account_token.tf
├── custom_waf.tf
├── managed_waf.tf
├── member.tf
├── provider.tf
└── variable.tf
```

### Zone-Level Configurations (`scottpearson.net`)

These files manage settings specific to the `scottpearson.net` zone and are located in the `scottpearson.net/` directory.

```
scottpearson.net/
├── custom_hostnames.tf
├── dns.tf
├── lb.tf
├── provider.tf
├── settings.tf
├── spectrum.tf
├── ssl.tf
└── variable.tf
```

## Contributing

Feel free to open issues or submit pull requests. Please ensure your changes align with the project's goals and follow best practices for Terraform.

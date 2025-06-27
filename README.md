# Cloudflare Terraform Account and Zone Configurations

This repository manages Cloudflare account and zone-level configurations using Terraform.

## Features

- Centralized management of Cloudflare DNS records.
- Configuration of Cloudflare zone settings (e.g., SSL/TLS, caching, security).
- Management of Cloudflare account-level settings.

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

## Repository Structure (Example)

```
.
├── main.tf             # Main Terraform configuration file
├── variables.tf        # Input variables definitions
├── outputs.tf          # Output values definitions
├── versions.tf         # Terraform and provider version constraints
└── README.md
```

## Contributing

Feel free to open issues or submit pull requests. Please ensure your changes align with the project's goals and follow best practices for Terraform.

## License

This project is licensed under the MIT License - see the `LICENSE` file for details (if applicable, otherwise remove this section or specify your license).
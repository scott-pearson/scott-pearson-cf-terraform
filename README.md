# Cloudflare Terraform Configuration

This repository stores Terraform configurations for managing Cloudflare resources.

## Directory Structure

The repository is organized by Cloudflare accounts and then by zones (domains) within those accounts.

```
.
├── <ACCOUNT_NAME>/
│   ├── <ZONE_NAME>/
│   │   ├── main.tf         # Zone-specific resources
│   │   ├── dns.tf          # DNS records
│   │   ├── provider.tf     # Terraform provider configuration
│   │   └── ...             # Other zone-level configurations
│   │
│   ├── account.tf        # Account-level resources
│   ├── provider.tf       # Account-level provider configuration
│   └── ...               # Other account-level configurations
│
├── <ANOTHER_ACCOUNT_NAME>/
│   └── ...
│
└── README.md
```

### Account Level

- Each top-level directory corresponds to a Cloudflare Account (e.g., `Scott Pearson/`).
- Terraform files placed directly within an account directory manage account-level resources such as account settings, custom roles, or notifications.

### Zone Level

- Within each account directory, subdirectories correspond to specific Cloudflare Zones (e.g., `scottpearson.net/`).
- These directories contain the Terraform configurations for all resources associated with that zone, including DNS records, WAF rules, page rules, and SSL settings.

## Usage

To apply changes for a specific account or zone, navigate to the corresponding directory and run the standard Terraform workflow:

1.  `terraform init`
2.  `terraform plan`
3.  `terraform apply`
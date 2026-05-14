# Terraform — AWS EC2 + Vault

Provisions EC2 instance with secrets pulled from Vault.

## Resources

- **EC2** — `t3.micro` (free-tier eligible) in `us-east-1`
- **Vault** — AppRole auth, reads from `test-secret/vault`

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Prerequisites

Valid Vault AppRole credentials (`vault_role_id`, `vault_secret_id`) in `terraform.tfvars` or env vars.

## Files

| File | Purpose |
|------|---------|
| `main.tf` | Providers + resources |
| `vars.tf` | Variable declarations |
| `terraform.tfvars` | Secrets (gitignored) |

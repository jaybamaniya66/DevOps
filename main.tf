provider "aws" {
    region = "us-east-1"
}

provider "vault" {
  address = "<>:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "test-secret"
  name = "vault"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"

  tags = {
    Name = "test"
    free-tier-eligible=true
    Secret = data.vault_kv_secret_v2.example.name
  }
}
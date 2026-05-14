# terraform {
#   backend "s3" {
#     bucket         = "backend-demo-s3-jay"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"
#   }
# }
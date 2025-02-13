terraform {
  backend "s3" {
    bucket         = "terraform-remote-backend-multicloud-marcus-bieber"
    key            = "backend/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-2"
  }
}

#### Terraform S3 Backend ####
terraform {
  backend "s3" {
    bucket         = "terraform-demo-12"
    dynamodb_table = "demo-terraform-state"
    region         = "us-east-1"
    key            = "terraform_state/terraform-infra/terraform.tfstate"
  }
  required_version = ">= 0.14.3"
}

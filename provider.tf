provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.37.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.1.0"
    }
  }
}

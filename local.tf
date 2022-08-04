locals {
  env               = terraform.workspace

  names = {
    "dev"  = "dev-jenkins"
    "beta" = "beta-jenkins"
    "prod" = "prod-jenkins"
  }

  aws_accounts = {
    "dev"  = "446287697953"
    "beta" = "446287697953"
    "prod" = "446287697953"
  }

  instance_types = {
    "dev"  = "t2.micro"
    "beta" = "t3.micro"
    "prod" = "t2.micro"
  }

  key_names = {
    "dev"  = "terraform"
    "beta" = "terraform"
    "prod" = "terraform" 
  }


  subnet_ids = {
    "dev"  = "subnet-0db85011ba6c8d8dd"
    "beta" = "subnet-0db85011ba6c8d8dd"
    "prod" = "subnet-0db85011ba6c8d8dd"
  }

  ami_ids = {
    "dev"  = "ami-0d2bde977fbcec9b0"
    "beta" = "ami-0d2bde977fbcec9b0"
    "prod" = "ami-0d2bde977fbcec9b0"
  }
  

  
  
  aws_region               = "us-east-1"
  name                     = lookup(local.names, local.env)
  aws_account              = lookup(local.aws_accounts, local.env)
  instance_type            = lookup(local.instance_types, local.env)
  key_name                 = lookup(local.key_names, local.env)
  subnet_id                = lookup(local.subnet_ids, local.env)
  ami_id                   = lookup(local.ami_ids, local.env)
  ami                      = amazonlinux
}

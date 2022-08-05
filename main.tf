module "ssh_key_pair" {
  source = "git@github.com:devopsteamG/terraform-aws-key-pair?ref=master"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  namespace             = "eg"
  stage                 = "prod"
  name                  = "app"
  ssh_public_key_path   = "/secrets"
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"

}
module "ec2_instance" {
  source                 = "git@github.com:devopsteamG/aws-terraform-modules.git//ec2?ref=main"

  name                   = local.name
  instance_count         = 1
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name               = module.ssh_key_pair.key_name
  monitoring             = true
  vpc_security_group_ids = ["sg-02d0e17e697c43042"]
  subnet_id              = local.subnet_id

  tags = module.label.tags
}


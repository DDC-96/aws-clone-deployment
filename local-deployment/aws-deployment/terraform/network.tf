module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = [var.Zone1, var.Zone2]
  private_subnets = [var.priv_1cidr, var.priv_2cidr]
  public_subnets  = [var.pub_1cidr, var.pub_2cidr]

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Terraform   = "true"
    Environment = "Dev"
  }

  vpc_tags = {
    Name = var.vpc_name
  }
}

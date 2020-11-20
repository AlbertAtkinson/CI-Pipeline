provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

module "aws_vpc" {
  source = "./vpc"
}

module "aws_ec2" {
  source                      = "./ec2"
  subnet_id                   = module.aws_vpc.sub-A-id
  vpc_id                      = module.aws_vpc.vpcid
  associate_public_ip_address = true
}

module "aws_rds" {
  source        = "./rds"
  sub-A-id      = module.aws_vpc.sub-A-id
  sub-B-id      = module.aws_vpc.sub-B-id
  sg-A-id       = module.aws_ec2.sg-id
  test-username = var.testusername
  test-password = var.testpassword
  k8s-username  = var.k8susername
  k8s-password  = var.k8spassword
}

module "aws_eks" {
  source   = "./EKS"
  sub-A-id = module.aws_vpc.sub-A-id
  sub-B-id = module.aws_vpc.sub-B-id
  sg-A-id  = module.aws_ec2.sg-id
}
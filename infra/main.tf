provider "aws" {
  region = var.aws_region
}

module "networking" {
  source    = "../../modules/networking"
  project   = var.project
  vpc_cidr  = "10.0.0.0/16"
}

module "iam" {
  source  = "../../modules/iam"
  project = var.project
}

module "s3" {
  source  = "../../modules/s3"
  project = var.project
}

module "beanstalk" {
  source            = "../../modules/beanstalk"
  project           = var.project
  vpc_id            = module.networking.vpc_id
  subnets           = module.networking.public_subnets
  instance_profile  = module.iam.instance_profile
  environment       = "dev"
}
provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  region         = var.region
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  public_subnets  = module.vpc.public_subnet_ids
  depends_on      = [module.vpc]
}

module "rds" {
  source = "./modules/rds"

  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnet_ids
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  eks_security_group_id = module.eks.eks_security_group
  bastion_security_group_id = module.bastion.bastion_security_group_id
  depends_on        = [module.vpc]
}

module "bastion" {
  source = "./modules/bastion"

  vpc_id         = module.vpc.vpc_id
  public_subnet  = module.vpc.public_subnet_ids[0]
  depends_on     = [module.vpc]
}
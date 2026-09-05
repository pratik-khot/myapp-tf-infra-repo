module "vpc" {
  source = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/vpc"

  region                = var.region
  vpc_cidr              = var.vpc_cidr
  az_count              = var.az_count
  subnet_newbits        = var.subnet_newbits
  nat_availability_mode = var.nat_availability_mode
  environment           = var.environment
  project_name          = var.project_name
  project_owner         = var.project_owner
  default_sg_required   = var.default_sg_required
}

module "eks" {
  source          = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  region          = var.region
  subnet_ids      = module.vpc.private_subnet_ids
  auth_mode       = var.auth_mode
  eks_mode        = var.eks_mode
  create_lbc_role = var.create_lbc_role
}

module "ec2" {
  source               = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  availability_zone    = var.az
  subnet_id            = module.vpc.public_subnet_map[var.az]
  sg_ids               = [module.vpc.default_security_group_id]
  enable_public_ip     = var.enable_public_ip
  app_name             = var.project_name
  instance_no          = 1
  env                  = var.environment
  iam_instance_profile = var.iam_instance_profile

  root_volume_specs = var.root_volume_specs

  data_volume_specs = var.data_volume_specs
}

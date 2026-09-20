module "vpc" {
  source = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/vpc?ref=v0.2.1"

  region                  = var.region
  vpc_cidr                = var.vpc_cidr
  az_count                = var.az_count
  subnet_newbits          = var.subnet_newbits
  nat_availability_mode   = var.nat_availability_mode
  environment             = var.environment
  project_name            = var.project_name
  project_owner           = var.project_owner
  default_sg_required     = var.default_sg_required
  availability_zone_names = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "eks-standard" {
  source                             = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/eks?ref=v0.2.1"
  cluster_name                       = var.cluster_name
  cluster_version                    = var.cluster_version
  node_group_scaling                 = var.node_group_scaling
  node_instance_types                = var.node_instance_types
  node_disk_size                     = var.node_disk_size
  region                             = var.region
  subnet_ids                         = module.vpc.private_subnet_ids
  auth_mode                          = var.auth_mode
  eks_mode                           = var.eks_mode
  create_lbc_role                    = var.create_lbc_role
  create_external_dns_role           = var.create_external_dns_role
  external_dns_hosted_zone_arns      = var.external_dns_hosted_zone_arns
  create_secrets_store_provider_role = var.create_secrets_store_provider_role
  secrets_manager_secret_arns        = var.secrets_manager_secret_arns
  secrets_manager_kms_key_arns       = var.secrets_manager_kms_key_arns
  use_karpenter                      = var.use_karpenter
}

module "ec2" {
  source               = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/ec2?ref=v0.2.1"
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

module "eks-auto" {
  source                             = "git::https://github.com/pratik-khot/aws-terraform-modules.git//modules/eks?ref=v0.2.1"
  cluster_name                       = "eks-auto"
  cluster_version                    = "1.36"
  region                             = "us-east-1"
  subnet_ids                         = module.vpc.private_subnet_ids
  auth_mode                          = "API_AND_CONFIG_MAP"
  eks_mode                           = "auto"
  create_lbc_role                    = false
  create_external_dns_role           = true
  create_secrets_store_provider_role = false
  use_karpenter                      = false
}



locals {
  clusters = {
    eks-auto     = module.eks-auto.eks_cluster_name
    eks-standard = module.eks-standard.eks_cluster_name
  }
}

resource "aws_eks_access_entry" "cluster_admin" {
  for_each = local.clusters

  cluster_name  = each.value
  principal_arn = var.cluster_admin_role_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "cluster_admin" {
  for_each = local.clusters

  cluster_name  = each.value
  principal_arn = aws_eks_access_entry.cluster_admin[each.key].principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
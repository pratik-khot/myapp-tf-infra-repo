##VPC Vars

vpc_cidr              = "10.20.0.0/16"
subnet_newbits        = 8
region                = "us-east-1"
az_count              = 3
nat_availability_mode = "zonal"
environment           = "dev"
project_name          = "Infra"
project_owner         = "DevOps Team"

###EKS Cluster vars
default_sg_required = true
cluster_name        = "myapp-eks"
cluster_version     = "1.34"
node_group_scaling = {
  desired_size = 3
  max_size     = 5
  min_size     = 1
}
node_instance_types                = ["t3.medium"]
node_disk_size                     = 50
use_karpenter                      = true
eks_mode                           = "standard"
auth_mode                          = "API_AND_CONFIG_MAP"
create_lbc_role                    = true
create_external_dns_role           = true
create_secrets_store_provider_role = false
secrets_manager_secret_arns        = []
secrets_manager_kms_key_arns       = []
external_dns_hosted_zone_arns      = ["arn:aws:route53:::hostedzone/Z06146882ZLBOOM6B9O7L"]
cluster_admin_role_arn             = "arn:aws:iam::226860145733:user/cloud_user"

##EC2 Instance vars
ami_id           = "ami-0b6d9d3d33ba97d99"
instance_type    = "t2.micro"
az               = "us-east-1a"
enable_public_ip = true
root_volume_specs = {
  delete_on_termination = true
  encrypted             = true
  size                  = 100
  type                  = "gp3"
}

data_volume_specs = {
  "data01" = {
    delete_on_termination = true
    device_name           = "/dev/sdf"
    encrypted             = true
    size                  = 100
    iops                  = 3000
  }
}
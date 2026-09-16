output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "public_subnet_map" {
  value = module.vpc.public_subnet_map
}

output "private_subnet_map" {
  value = module.vpc.private_subnet_map
}


output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "eks_cluster_security_group_ids" {
  value = module.eks.eks_cluster_sgs
}

output "eks_cluster_certificate_authority_data" {
  value = module.eks.eks_cluster_certificate_authority_data
}

output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "external_dns_role_arn" {
  value = module.eks.external_dns_role_arn
}

output "external_dns_pod_identity_association_id" {
  value = module.eks.external_dns_pod_identity_association_id
}

output "secrets_store_provider_role_arn" {
  value = module.eks.secrets_store_provider_role_arn
}

output "secrets_store_provider_pod_identity_association_id" {
  value = module.eks.secrets_store_provider_pod_identity_association_id
}

output "eks_cluster_connection" {
  description = "cluster connection"
  value       = module.eks.eks_cluster_connection

}

output "load_balancer_controller_arn" {
  value = module.eks.load_balancer_controller_role_arn
}

output "load_balancer_controller_role_arn" {
  value = module.eks.load_balancer_controller_role_arn
}

output "vpc_cni_role_arn" {
  value = module.eks.vpc_cni_role_arn
}

output "ebs_csi_role_arn" {
  value = module.eks.ebs_csi_role_arn
}

output "load_balancer_controller_pod_identity_association_id" {
  value = module.eks.load_balancer_controller_pod_identity_association_id
}
output "aws_instance_id" {
  value = module.ec2.instance_id
}

output "aws_instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "aws_instance_private_ip" {
  value = module.ec2.instance_private_ip
}

output "attached_ebs_volume_ids" {
  value = module.ec2.attached_ebs_volume_ids
}


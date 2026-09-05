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

output "eks_cluster_connection" {
  description = "cluster connection"
  value       = module.eks.eks_cluster_connection

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


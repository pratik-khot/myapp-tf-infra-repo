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
  value = module.eks-standard.eks_cluster_endpoint
}

output "eks_cluster_security_group_ids" {
  value = module.eks-standard.eks_cluster_sgs
}

output "eks_cluster_certificate_authority_data" {
  value = module.eks-standard.eks_cluster_certificate_authority_data
}

output "eks_cluster_name" {
  value = module.eks-standard.eks_cluster_name
}

output "external_dns_role_arn" {
  value = module.eks-standard.external_dns_role_arn
}

output "external_dns_pod_identity_association_id" {
  value = module.eks-standard.external_dns_pod_identity_association_id
}

output "secrets_store_provider_role_arn" {
  value = module.eks-standard.secrets_store_provider_role_arn
}

output "secrets_store_provider_pod_identity_association_id" {
  value = module.eks-standard.secrets_store_provider_pod_identity_association_id
}

output "eks-standard_cluster_connection" {
  description = "cluster connection"
  value       = module.eks-standard.eks_cluster_connection

}

output "eks-auto_cluster_connection" {
  description = "cluster connection"
  value       = module.eks-auto.eks_cluster_connection

}

output "load_balancer_controller_arn" {
  value = module.eks-standard.load_balancer_controller_role_arn
}

output "load_balancer_controller_role_arn" {
  value = module.eks-standard.load_balancer_controller_role_arn
}

output "vpc_cni_role_arn" {
  value = module.eks-standard.vpc_cni_role_arn
}

output "ebs_csi_role_arn" {
  value = module.eks-standard.ebs_csi_role_arn
}

output "load_balancer_controller_pod_identity_association_id" {
  value = module.eks-standard.load_balancer_controller_pod_identity_association_id
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

output "karpenter_controller_role_arn" {
  value = module.eks-standard.karpenter_controller_role_arn
}

output "karpenter_controller_policy_arn" {
  description = "IAM policy ARN attached to the Karpenter controller role."
  value       = module.eks-standard.karpenter_controller_policy_arn
}

output "karpenter_controller_pod_identity_association_id" {
  description = "Pod Identity association ID for the Karpenter controller."
  value       = module.eks-standard.karpenter_controller_pod_identity_association_id
}

output "karpenter_node_role_arn" {
  description = "IAM role ARN used by Karpenter-provisioned nodes."
  value       = module.eks-standard.karpenter_node_role_arn
}

output "karpenter_node_instance_profile_arn" {
  description = "Instance profile ARN used by Karpenter-provisioned nodes."
  value       = module.eks-standard.karpenter_node_instance_profile_arn
}

output "karpenter_node_instance_profile_name" {
  description = "Instance profile name used by Karpenter-provisioned nodes."
  value       = module.eks-standard.karpenter_node_instance_profile_name
}

output "karpenter_interruption_queue_arn" {
  description = "ARN of the SQS queue used for Karpenter interruption events."
  value       = module.eks-standard.karpenter_interruption_queue_arn
}

output "karpenter_interruption_queue_url" {
  description = "URL of the SQS queue used for Karpenter interruption events."
  value       = module.eks-standard.karpenter_interruption_queue_url
}

output "karpenter_health_event_rule_arn" {
  description = "ARN of the EventBridge rule for AWS Health events."
  value       = module.eks-standard.karpenter_health_event_rule_arn
}

output "karpenter_spot_interrupt_rule_arn" {
  description = "ARN of the EventBridge rule for EC2 Spot interruption warnings."
  value       = module.eks-standard.karpenter_spot_interrupt_rule_arn
}

output "karpenter_rebalance_rule_arn" {
  description = "ARN of the EventBridge rule for EC2 rebalance recommendations."
  value       = module.eks-standard.karpenter_rebalance_rule_arn
}

output "karpenter_instance_state_rule_arn" {
  description = "ARN of the EventBridge rule for EC2 instance state changes."
  value       = module.eks-standard.karpenter_instance_state_rule_arn
}

output "eks-auto_cluster_endpoint" {
  value = module.eks-auto.eks_cluster_endpoint
}

output "eks-auto_cluster_security_group_ids" {
  value = module.eks-auto.eks_cluster_sgs
}

output "eks-auto_cluster_certificate_authority_data" {
  value = module.eks-auto.eks_cluster_certificate_authority_data
}

output "eks-auto_cluster_name" {
  value = module.eks-auto.eks_cluster_name
}

output "eks-auto_external_dns_role_arn" {
  value = module.eks-auto.external_dns_role_arn
}

output "eks-auto_external_dns_pod_identity_association_id" {
  value = module.eks-auto.external_dns_pod_identity_association_id
}
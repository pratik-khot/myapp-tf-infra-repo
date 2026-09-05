variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "az_count" {
  description = "The number of Availability Zones to use"
  type        = number
}

variable "subnet_newbits" {
  description = "The number of bits to use for the subnet mask"
  type        = number
}

variable "nat_availability_mode" {
  description = "The availability mode for the NAT gateway"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "Infra"
}

variable "project_owner" {
  description = "The owner of the project"
  type        = string
  default     = "Infra Team"
}

variable "default_sg_required" {
  description = "Whether to create a default public security group to allow all traffic within the VPC"
  type        = bool
  default     = true
}

variable "log_group_kms_key_arn" {
  type    = string
  default = null
}

variable "log_group_retention_in_days" {
  type    = number
  default = 365
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.36"
}

variable "region" {
  description = "The AWS region where the EKS cluster will be created."
  type        = string
}


variable "creator_admin_permissions" {
  description = "Whether to grant admin permissions to the cluster creator."
  type        = bool
  default     = true
}

variable "auth_mode" {
  description = "The authentication mode for the EKS cluster."
  type        = string
  default     = "API_AND_CONFIG_MAP"
}

variable "eks_mode" {
  type    = string
  default = "standard"
}

variable "enable_fargate" {
  type    = bool
  default = false
}
variable "fargate_namespace" {
  default = "default"
}

variable "addons" {
  type    = map(any)
  default = {}
}

variable "create_lbc_role" {
  description = "Whether to create an IAM role,policy,PIA for the AWS Load Balancer Controller"
  type        = bool
  default     = false
}

variable "root_volume_specs" {
  description = "Root volume specifications for the instance"
  type = object({
    size                  = number
    type                  = optional(string, "gp3")
    delete_on_termination = bool
    encrypted             = optional(bool, true)
    kms_key_id            = optional(string)
  })

  default = {
    size                  = 20
    type                  = "gp3"
    delete_on_termination = true
    encrypted             = true
  }
}

variable "data_volume_specs" {
  description = "Optional additional EBS volume definitions keyed by logical name. This is only used when you want to define volumes outside the instance block."
  type = map(object({
    instance_key          = optional(string)
    size                  = number
    type                  = optional(string, "gp3")
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, true)
    device_name           = string
    kms_key_id            = optional(string)
    iops                  = optional(number)
    throughput            = optional(number)
  }))

  default = {}
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  type = string
}

variable "az" {
  type = string

}

variable "iam_instance_profile" {
  type    = string
  default = null

}

variable "enable_public_ip" {

}

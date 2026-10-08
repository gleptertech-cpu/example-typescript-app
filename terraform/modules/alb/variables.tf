variable "name" {
  description = "Name prefix for the ALB and target group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to deploy the ALB into"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the ALB (public subnets)"
  type        = list(string)
}

variable "container_port" {
  description = "Port the target group forwards to on each task"
  type        = number
}

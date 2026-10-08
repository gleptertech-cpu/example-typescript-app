variable "name" {
  description = "Name for the cluster, task family and service"
  type        = string
}

variable "app_name" {
  description = "Container name within the task definition"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod) - used to set NODE_ENV"
  type        = string
}

variable "aws_region" {
  description = "Region, used for the CloudWatch log driver configuration"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID the service's tasks run in"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the Fargate tasks"
  type        = list(string)
}

variable "container_port" {
  description = "Port the application listens on inside the container"
  type        = number
}

variable "image" {
  description = "Full image reference to run, e.g. '<ecr-repo-url>:<tag>'"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role ARN ECS uses to pull the image and write logs"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role ARN the application assumes for AWS API calls"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN the service registers its tasks into"
  type        = string
}

variable "alb_security_group_id" {
  description = "ALB's security group ID - the task security group only allows traffic from this"
  type        = string
}

variable "desired_count" {
  description = "Number of Fargate tasks to run"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "Fargate task CPU units"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Fargate task memory, in MiB"
  type        = number
  default     = 512
}

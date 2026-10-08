variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-southeast-2"
}

variable "app_name" {
  description = "Application name, used to prefix resource names"
  type        = string
  default     = "example-typescript-app"
}

variable "container_port" {
  description = "Port the application listens on inside the container"
  type        = number
  default     = 3000
}

variable "image_tag" {
  description = "Docker image tag to deploy (set by CI to the git SHA; defaults to latest for first apply)"
  type        = string
  default     = "latest"
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

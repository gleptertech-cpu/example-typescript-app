variable "aws_region" {
  description = "AWS region to create the state bucket in"
  type        = string
  default     = "ap-southeast-2"
}

variable "bucket_name" {
  description = "Name of the S3 bucket that holds Terraform state for the main config - must match the 'bucket' value in terraform/terraform.tf's backend block"
  type        = string
  default     = "bell-fg-example-typescript-app-tfstate"
}

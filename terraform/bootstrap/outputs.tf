# output.tf

output "bucket_id" {
  description = "Name of the state bucket - must match terraform/terraform.tf's backend 'bucket' value"
  value       = aws_s3_bucket.tfstate.id
}

output "bucket_arn" {
  description = "ARN of the state bucket"
  value       = aws_s3_bucket.tfstate.arn
}

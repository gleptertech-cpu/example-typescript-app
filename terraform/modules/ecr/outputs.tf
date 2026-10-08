# output.tf

output "repository_url" {
  description = "URL to push/pull images, e.g. for use as '<url>:<tag>' in a task definition"
  value       = aws_ecr_repository.this.repository_url
}

output "repository_arn" {
  description = "ARN of the repository"
  value       = aws_ecr_repository.this.arn
}

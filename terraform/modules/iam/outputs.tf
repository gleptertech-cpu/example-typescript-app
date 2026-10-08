# output.tf

output "execution_role_arn" {
  description = "Role ARN ECS uses to pull the image and write logs"
  value       = aws_iam_role.execution.arn
}

output "task_role_arn" {
  description = "Role ARN the running application assumes for AWS API calls (currently none)"
  value       = aws_iam_role.task.arn
}

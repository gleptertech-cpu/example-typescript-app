# output.tf

output "alb_dns_name" {
  description = "Public DNS name - the app is reachable at http://<this>/"
  value       = aws_lb.this.dns_name
}

output "target_group_arn" {
  description = "Target group ARN for the ECS service to register tasks into"
  value       = aws_lb_target_group.this.arn
}

output "alb_security_group_id" {
  description = "ALB's security group ID, so the task security group can allow traffic from it specifically"
  value       = aws_security_group.alb.id
}

output "listener_arn" {
  description = "HTTP listener ARN - exists purely so the ECS service can depend on the listener being ready before attaching"
  value       = aws_lb_listener.http.arn
}

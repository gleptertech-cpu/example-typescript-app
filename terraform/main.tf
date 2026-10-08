# Root config: looks up the network context once, then composes the
# per-service modules below (ecr, iam, alb, ecs) by wiring their outputs
# into each other's inputs. Uses the account's default VPC rather than a
# custom one - a deliberate scope cut for a one-hour exercise on a trivial
# app, not an oversight. See PROPOSAL.md.
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ecr" {
  source = "./modules/ecr"
  name   = local.name
}

module "iam" {
  source = "./modules/iam"
  name   = local.name
}

module "alb" {
  source         = "./modules/alb"
  name           = local.name
  vpc_id         = data.aws_vpc.default.id
  subnet_ids     = data.aws_subnets.default.ids
  container_port = var.container_port
}

module "ecs" {
  source = "./modules/ecs"

  name        = local.name
  app_name    = var.app_name
  environment = local.environment
  aws_region  = var.aws_region

  vpc_id         = data.aws_vpc.default.id
  subnet_ids     = data.aws_subnets.default.ids
  container_port = var.container_port

  image                 = "${module.ecr.repository_url}:${var.image_tag}"
  execution_role_arn    = module.iam.execution_role_arn
  task_role_arn         = module.iam.task_role_arn
  target_group_arn      = module.alb.target_group_arn
  alb_security_group_id = module.alb.alb_security_group_id

  desired_count = var.desired_count
  cpu           = var.cpu
  memory        = var.memory

  # The service shouldn't attach to the target group before the ALB's
  # listener exists - this is a module-level ordering dependency, not
  # something expressible through a resource attribute reference alone.
  depends_on = [module.alb]
}

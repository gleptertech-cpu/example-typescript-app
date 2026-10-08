# locals.tf

locals {
  # Which environment this is comes from the selected Terraform workspace,
  # not a variable - that way there's no way to accidentally apply with
  # the wrong environment name while actually sitting in a different
  # workspace's state. Looking the workspace up in this map is also the
  # validation: an unexpected workspace name fails fast with Terraform's
  # own "invalid index" error, rather than silently creating resources
  # under whatever name was typed.
  environment = {
    dev     = "dev"
    staging = "staging"
    prod    = "prod"
  }[terraform.workspace]

  name = "${var.app_name}-${local.environment}"
}

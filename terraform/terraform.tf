terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  # dev/staging/prod are separate Terraform workspaces (see main.tf's
  # `local.environment` lookup), not separate backend keys - the S3
  # backend automatically prefixes this key with "env:/<workspace>/" per
  # workspace, so one key here already gives each environment its own,
  # fully isolated state file with no manual -backend-config overrides.
  backend "s3" {
    bucket = "bell-fg-example-typescript-app-tfstate" # created by terraform/bootstrap - run that first
    key    = "example-typescript-app/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = var.aws_region
}

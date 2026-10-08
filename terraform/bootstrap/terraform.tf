# Deliberately no backend block here, unlike the main terraform/ config.
# This creates the bucket that the main config's backend depends on - it
# can't use that same backend itself (the bucket wouldn't exist yet on a
# first run). State for this bootstrap config stays local; it's applied
# once, rarely touched again, and isn't something multiple people need
# shared access to the way the main app's state is.
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

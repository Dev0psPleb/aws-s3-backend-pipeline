provider "aws" {
  region = "us-west-1"
  alias  = "usw1"
}

provider "aws" {
  region = "us-west-2"
  alias  = "usw2"
}

provider "aws" {
  region = "us-east-1"
  alias  = "use1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "use2"
}

provider "aws" {
  alias  = "replica"
  region = local.replica_region
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

locals {
  aws_region     = data.aws_region.current.name
  replica_region = lookup(var.replica_region, local.aws_region)
  create_date    = formatdate("MM-DD-YYYY", timestamp())
  default_tags = {
    managed_by              = "Terraform"
    create_or_modified_date = local.create_date
    contact_email           = var.contact_email
    created_by              = var.created_by
    pipeline                = var.pipeline
  }
}

module "remote_state" {
  source  = "nozaq/remote-state-s3-backend/aws"
  version = "1.2.0"
  # insert the 3 required variables here
  providers = {
    aws         = aws
    aws.replica = aws.replica
  }
  tags = merge(
    local.default_tags
  )
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = data.aws_caller_identity.current.user_id
  policy_arn = module.remote_state.terraform_iam_policy.arn
}

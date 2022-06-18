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
  region = var.aws_region
  assume_role {
    role_arn     = var.role_arn
    session_name = var.session_name
    external_id  = var.external_id
  }
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

resource "aws_iam_user" "terraform" {
  name = "TerraformUser"
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = aws_iam_user.terraform.name
  policy_arn = module.remote_state.terraform_iam_policy.arn
}

data "template_file" "backend" {
  template = file("${path.module}/templates/backend.tf.tpl")
  vars = {
    s3_bucket      = module.remote_state.state_bucket.bucket
    pipeline       = var.pipeline
    aws_region     = var.aws_region
    kms_key_id     = module.remote_state.kms_key.key_id
    dynamodb_table = module.remote_state.dynamodb_table.id
  }
}

resource "local_file" "backend" {
  content  = data.template_file.backend.rendered
  filename = "../backend.tf"
}

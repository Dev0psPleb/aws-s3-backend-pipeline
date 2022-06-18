terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      configuration_aliases = [
        aws.use1,
        aws.use2,
        aws.usw1,
        aws.usw2
      ]
    }
  }
#  backend "s3" {
#    bucket = "bucket-name-replace-me"
#    key = "s3-key-name-replace-me"
#    region = "aws-region-replace-me"
#    encrypt = true
#    kms_key_id = "kms-key-id-replace-me"
#    dynamodb_table = "dynamo-db-table-replace-me"
#  }
}

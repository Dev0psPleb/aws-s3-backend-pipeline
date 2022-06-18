output "aws_region" {
  value = var.aws_region
}

output "dynamo_db" {
  value = module.remote_state.dynamodb_table.id
}

output "kms_key" {
  value = module.remote_state.kms_key.key_id
}

output "replica_region" {
  value = local.replica_region
}

output "state_bucket" {
  value = module.remote_state.state_bucket.bucket
}

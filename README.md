# aws-s3-backend-pipeline

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_remote_state"></a> [remote\_state](#module\_remote\_state) | nozaq/remote-state-s3-backend/aws | 1.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_user.terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.remote_state_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [local_file.backend](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [template_file.backend](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region in which to deploy resources | `string` | n/a | yes |
| <a name="input_contact_email"></a> [contact\_email](#input\_contact\_email) | Contact email of the person creating the resources | `string` | n/a | yes |
| <a name="input_created_by"></a> [created\_by](#input\_created\_by) | First and last name of the person creating the resources | `string` | n/a | yes |
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | Conditional external ID to authorize role assumption | `string` | n/a | yes |
| <a name="input_factory_user_name"></a> [factory\_user\_name](#input\_factory\_user\_name) | Factory IAM AWS user. | `string` | `""` | no |
| <a name="input_pipeline"></a> [pipeline](#input\_pipeline) | The name of the Factory Pipeline being run | `string` | n/a | yes |
| <a name="input_replica_region"></a> [replica\_region](#input\_replica\_region) | AWS Replica Region for S3 Backend | `map` | <pre>{<br>  "us-east-1": "us-west-1",<br>  "us-east-2": "us-west-2",<br>  "us-west-1": "us-east-1",<br>  "us-west-2": "us-east-2"<br>}</pre> | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | ARN of the role to assume | `string` | n/a | yes |
| <a name="input_session_name"></a> [session\_name](#input\_session\_name) | Session name to tag to the assume role session | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | n/a |
| <a name="output_dynamo_db"></a> [dynamo\_db](#output\_dynamo\_db) | n/a |
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | n/a |
| <a name="output_replica_region"></a> [replica\_region](#output\_replica\_region) | n/a |
| <a name="output_state_bucket"></a> [state\_bucket](#output\_state\_bucket) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

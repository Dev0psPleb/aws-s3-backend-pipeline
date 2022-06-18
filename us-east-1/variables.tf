variable "aws_region" {
  description = "AWS Region in which to deploy resources"
  type        = string
}

variable "contact_email" {
  description = "Contact email of the person creating the resources"
  type        = string
}

variable "created_by" {
  description = "First and last name of the person creating the resources"
  type        = string
}

variable "external_id" {
  description = "Conditional external ID to authorize role assumption"
  type        = string
  sensitive   = true
}

variable "factory_user_name" {
  description = "Factory IAM AWS user."
  type        = string
  sensitive   = true
  default     = ""
}

variable "pipeline" {
  description = "The name of the Factory Pipeline being run"
  type        = string
}

variable "replica_region" {
  description = "AWS Replica Region for S3 Backend"
  default = {
    us-east-1 = "us-west-1"
    us-east-2 = "us-west-2"
    us-west-1 = "us-east-1"
    us-west-2 = "us-east-2"
  }
}

variable "role_arn" {
  description = "ARN of the role to assume"
  type        = string
  sensitive   = true
}

variable "session_name" {
  description = "Session name to tag to the assume role session"
  type        = string
  sensitive   = true
}

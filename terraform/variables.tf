variable "aws_secret_key" {
  type        = string
  description = "The secret key for AWS authentication"
}
variable "aws_access_key" {
  type        = string
  description = "The access key for AWS authentication"
}

variable "key-name" {
  type        = string
  description = "The name of the AWS key pair to use for SSH access to the EC2 instance."
}

# VPC Peering Variables
variable "aws_region" {
  description = "The AWS region in which to create the VPC peering connection"
  type = "string"
  default = "eu-west-1"
}

variable "requester_vpc_id" {
  description = "The VPC ID for the origin of the peering request"
  type = "string"
}

variable "destination_account_id" {
  description = "The AWS account ID for the destination VPC for this peering connection"
  type = "string"
}

variable "destination_tfstate_bucket" {
  description = "The name of the terraform state bucket in the destination account"
  type = "string"
}

variable "destination_tfstate_file" {
  description = "The name of the terraform state file in the destination account"
  type = "string"
}

# Tags
variable "peering_name_tag" {
  description = "The value for the 'Name' tag which will be placed on the aws_vpc_peering_connection object"
  type = "string"
}

# Route Table IDs
variable "public_route_tables" {
  description = "List of public routing tables to create the aws_route object from"
  type = "list"
}

variable "private_route_tables" {
  description = "List of private routing tables to create the aws_route object from"
  type = "list"
}

/* number_of_route_tables note
  Used by count to avoid interpolation issues of generating dynamic data,
  and subsequent cycle issues. The variable's value is based on the assumption 
  that VPC module only creates one route table for public subnets, which it 
  currently does. Awaiting feature or workaround from Terraform.
*/
variable "number_of_route_tables" {
  description = "Count of the number of routing tables. Used to avoid interpolation issues"
  type = "string"
}

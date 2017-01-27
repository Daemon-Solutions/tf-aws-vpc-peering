# VPC Peering Variables

variable "aws_region" {}

# VPC Peering Requester VPC ID
variable "requester_vpc_id" {}

# VPC Peer Management AWS Account ID
variable "management_account_id" {}

# VPC Peer Management TFState Bucket
variable "management_tfstate_bucket" {}

# VPC Peer Management TFState File
variable "management_tfstate_file" {}

# Tags
variable "peering_name_tag" {}

# Public Route Table IDs
variable "public_route_tables" {
  type = "list"
}

# Private Route Table IDs
variable "private_route_tables" {
  type = "list"
}

# Used by count to avoid interpolation issues of generating dynamic data
# and subsequent cycle issues. The variables value is based on the
# assumption that vpc module only creates one route table for public subnets,
# which it currently does.
# Awaiting feature from Terraform or workaround
variable "number_of_route_tables" {}

tf-aws-vpc-peering
==================

AWS VPC Peering - Terraform Module

The module creates a VPC peering connection and associated routes for the requesting account to an alternate peer AWS Account, typically a Management AWS account.

The VPC ID of the peer is determined via the peers tfstate file on S3 utilising Terraform remote_state.

The requesting account will require access to the peers tfstate bucket. Subsequent changes will be made to the makefile.ps1 to apply a bucket policy upon instantiation for known associated AWS accounts.   

Resources
---------

This module will create the following resources:

- VPC Peering Connection to Destination VPC
- Routes to Destination VPC for public and private subnets

Limitations
-----------

The following could be deamed as limitations or good security practice

- Manual accept peering connection on peer, though you have 7 days to do so
- Routes are not created on peer account to requesting account

Usage
-----

```js
module "vpc-peering" {
  source = "git@gogs.bashton.net:Bashton-Terraform-Modules/tf-aws-vpc-peering.git"

  aws_region                  = "${var.aws_region}"
  requester_vpc_id            = "${module.vpc.vpc_id}"
  destination_account_id      = "${var.destination_account_id}"
  destination_tfstate_bucket  = "${var.destination_tfstate_bucket}"
  destination_tfstate_file    = "${var.destination_tfstate_file}"
  peering_name_tag            = "${var.envtype}-to-destination-peering"
  public_route_tables         = "${module.vpc.public_route_tables}"
  private_route_tables        = "${module.vpc.private_route_tables}"
  number_of_route_tables      = "${length(var.private_subnets) + 1}"
}
```

Variables
---------

- `aws_region`                - AWS region
- `requester_vpc_id`          - the VPC ID of the account requesting peering
- `destination_account_id`    - the destination AWS account ID
- `destination_tfstate_bucket`- the destination AWS tfstate S3 bucket
- `destination_tfstate_file`  - the destination AWS tfstate file
- `peering_name_tag`          - the tag name for VPC peering connection
- `public_route_tables`       - the public route table IDs for requesting account
- `private_route_tables`      - the private route table IDs for requesting account

- `number_of_route_tables`    - Used by count to avoid interpolation issues of generating dynamic data and subsequent cycle issues. The variables value is based on the assumption that vpc module only creates one route table for public subnets, which it currently does. Awaiting feature from Terraform or alternative workaround

Outputs
-------

- `vpc_peering_connection_id`     - the VPC peering ID
- `vpc_peering_connection_status` - the VPC peering connnection status

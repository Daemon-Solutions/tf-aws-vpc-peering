# VPC Peering Datasources

data "terraform_remote_state" "management_remote_state" {
  backend = "s3"
  config {
    bucket    = "${var.management_tfstate_bucket}"
    key       = "${var.management_tfstate_file}"
    region    = "${var.aws_region}"
  }
}

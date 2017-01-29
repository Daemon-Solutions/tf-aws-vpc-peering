# VPC Peering Datasources

data "terraform_remote_state" "destination_remote_state" {
  backend = "s3"
  config {
    bucket    = "${var.destination_tfstate_bucket}"
    key       = "${var.destination_tfstate_file}"
    region    = "${var.aws_region}"
  }
}

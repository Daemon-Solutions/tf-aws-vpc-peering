# VPC Peering Resources

resource "aws_vpc_peering_connection" "peering" {
  peer_owner_id   = "${var.management_account_id}"
  peer_vpc_id     = "${data.terraform_remote_state.management_remote_state.vpc_id}"
  vpc_id          = "${var.requester_vpc_id}"

  tags {
    Name =  "${var.peering_name_tag}"
  }
}

resource "aws_route" "peering_routes" {
  count                     = "${var.number_of_route_tables}"
  route_table_id            = "${element(concat(var.public_route_tables, var.private_route_tables), count.index)}"
  destination_cidr_block    = "${data.terraform_remote_state.management_remote_state.vpc_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peering.id}"
}

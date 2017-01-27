# VPC Peering Outputs

output "vpc_peering_connection_id" {
  value = "${aws_vpc_peering_connection.peering.id}"
}

output "vpc_peering_connection_status" {
  value = "${aws_vpc_peering_connection.peering.accept_status}"
}

locals {
  tags   = var.tags
  env    = var.env
  region = var.region


  vpc = {
    create_vpc  = true
    enable_ipv6 = false
    name        = "${var.env}-java-springboot"
    cidr        = var.cidr
    azs         = slice(data.aws_availability_zones.available.names, 0, 2)

    map_public_ip_on_launch = var.map_public_ip_on_launch
    enable_nat_gateway      = var.enable_nat_gateway
    single_nat_gateway      = var.single_nat_gateway
    one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  }


}
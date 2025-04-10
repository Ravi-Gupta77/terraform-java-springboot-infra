locals {
  tags   = var.tags
  env    = var.env
  region = var.region


  vpc = {
    create_vpc  = true
    enable_ipv6 = false
    name        = "${var.env}-java-springboot"
    cidr        = var.cidr
    azs         = slice(data.aws_availability_zones.available.names, 0, 3)

    map_public_ip_on_launch = var.map_public_ip_on_launch
    enable_nat_gateway      = var.enable_nat_gateway
    single_nat_gateway      = var.single_nat_gateway
    one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  }

  ecr = {
    repository_name         = "${var.env}-java-springboot"
    create_lifecycle_policy = true
  }

  eks = {
    cluster_name    = "${var.env}-java-springboot-app"
    cluster_version = var.cluster_version

    cluster_endpoint_public_access           = var.cluster_endpoint_public_access
    enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  }
}

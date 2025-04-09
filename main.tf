################################################################################
# VPC Module
################################################################################

module "vpc" {
  source      = "terraform-aws-modules/vpc/aws"
  version     = "5.19.0"
  
  create_vpc  = local.vpc.create_vpc
  enable_ipv6 = local.vpc.enable_ipv6
  name        = local.vpc.name
  cidr        = local.vpc.cidr

  azs             = local.vpc.azs
  private_subnets = [for k, v in local.vpc.azs : cidrsubnet(local.vpc.cidr, 4, k)]
  public_subnets  = [for k, v in local.vpc.azs : cidrsubnet(local.vpc.cidr, 8, k + 48)]

  create_flow_log_cloudwatch_iam_role             = false
  create_flow_log_cloudwatch_log_group            = false
  flow_log_cloudwatch_log_group_retention_in_days = 7
  enable_flow_log                                 = false
  public_subnet_assign_ipv6_address_on_creation   = false
  map_public_ip_on_launch                         = local.vpc.map_public_ip_on_launch

  enable_nat_gateway     = local.vpc.enable_nat_gateway
  single_nat_gateway     = local.vpc.single_nat_gateway
  one_nat_gateway_per_az = local.vpc.one_nat_gateway_per_az

  tags = local.tags
}

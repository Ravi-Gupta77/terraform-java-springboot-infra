################################################################################
# EKS Module
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.35"

  cluster_name                   = "java-springboot-app"
  cluster_version                = "1.29"
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  control_plane_subnet_ids       = module.vpc.intra_subnets
  bootstrap_self_managed_addons  = false
  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true
  eks_managed_node_group_defaults = {
    instance_types = ["t3.small"]
  }

  eks_managed_node_groups = {
    main = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 2
      desired_size   = 2
    }
  }

  tags = local.tags
}

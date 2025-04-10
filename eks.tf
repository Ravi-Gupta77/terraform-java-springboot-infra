################################################################################
# EKS Module
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.35"

  cluster_name    = local.eks.cluster_name
  cluster_version = local.eks.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets

  control_plane_subnet_ids       = module.vpc.intra_subnets
  cluster_endpoint_public_access = local.eks.cluster_endpoint_public_access

  enable_cluster_creator_admin_permissions = local.eks.enable_cluster_creator_admin_permissions
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

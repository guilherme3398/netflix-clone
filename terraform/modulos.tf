module "eks_network" {
  source       = "./modulos/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "cluster_eks" {
  source           = "./modulos/cluster"
  cidr_block       = var.cidr_block
  project_name     = var.project_name
  public_subnet_1a = module.eks_network.public_subnet_1a
  public_subnet_1b = module.eks_network.public_subnet_1b
  private_subnet_1a = module.eks_network.private_subnet_1a
  private_subnet_1b = module.eks_network.private_subnet_1b
  node_role_arn = module.eks_managed_node_group.node_role_arn
  tags             = local.tags
}


module "eks_managed_node_group" {
  source            = "./modulos/managed-node-group"
  project_name      = var.project_name
  eks_name      = module.cluster_eks.eks_name
  private_subnet_1a = module.eks_network.private_subnet_1a
  private_subnet_1b = module.eks_network.private_subnet_1b
  tags              = local.tags
}

module "eks_aws_load_balancer_controller" {
  source       = "./modulos/load-balancer"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.cluster_eks.oidc
  eks_name = module.cluster_eks.eks_name
  vpc_id       = module.eks_network.vpc_id
  

  depends_on = [
    module.cluster_eks,
    module.eks_managed_node_group
  ]
}
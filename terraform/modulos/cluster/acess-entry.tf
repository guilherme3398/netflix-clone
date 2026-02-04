resource "aws_eks_access_entry" "node_role_arn" {
  cluster_name      = aws_eks_cluster.eks_cluster.name 
  principal_arn     = var.node_role_arn
  type              = "EC2_LINUX"
}


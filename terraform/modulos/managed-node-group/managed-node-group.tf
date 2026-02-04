resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.eks_name
  node_group_name = "${var.project_name}-managed-node-group"
  node_role_arn   = aws_iam_role.eks_managed_node_group.arn
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  tags = var.tags

   scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_manged_role_worker,
    aws_iam_role_policy_attachment.eks_manged_role_container_registry,
    aws_iam_role_policy_attachment.eks_manged_role_cni,
  ]
}
output "node_role_arn" {
  description = "ARN do node group"
  value = aws_iam_role.eks_managed_node_group.arn
}


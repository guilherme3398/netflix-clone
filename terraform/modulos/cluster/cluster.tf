resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-eks-cluster"
  role_arn = aws_iam_role.iam_role_cluster_eks.arn

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = [
      # var.public_subnet_1a,
      # var.public_subnet_1b,
      var.private_subnet_1a,
      var.private_subnet_1b
    ]
  }

  
access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment
  ]


  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks-cluster"
    }
  )
}
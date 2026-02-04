resource "aws_iam_role" "eks_managed_node_group" {
  name = "${var.project_name}-mng-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks-managed-node-role"
    }
  )
}

#--------Anexa a politica de Cluster e atribuindo permissões

resource "aws_iam_role_policy_attachment" "eks_manged_role_worker" {
  role       = aws_iam_role.eks_managed_node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_manged_role_container_registry" {
  role       = aws_iam_role.eks_managed_node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly"
}

resource "aws_iam_role_policy_attachment" "eks_manged_role_cni" {
  role       = aws_iam_role.eks_managed_node_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
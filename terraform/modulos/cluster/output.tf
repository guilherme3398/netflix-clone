output "eks_name" {
  description = "Nome do cluster eks"
  value = aws_eks_cluster.eks_cluster.name
}

output "oidc" {
    value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
  
}

output "certificate_authority" { 
    value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
  
}

output "endpoint" { 
    value = aws_eks_cluster.eks_cluster.endpoint
  
}


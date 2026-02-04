output "vpc_id" {
  description = "ID da vpc do projeto"
  value =   aws_vpc.netflix_eks_vpc.id
}

output "public_subnet_1a" {
  description = "ID da subnet publica 1a do projeto"
  value = aws_subnet.netflix_eks_sub_pub_1a.id
}

output "public_subnet_1b" {
  description = "ID da subnet publica 1b do projeto"
  value = aws_subnet.netflix_eks_sub_pub_1b.id
}

output "private_subnet_1a" {
  description = "ID da subnet privada 1a do projeto"
  value = aws_subnet.netflix_eks_sub_priv_1a.id
}

output "private_subnet_1b" {
  description = "ID da subnet privada 1b do projeto"
  value = aws_subnet.netflix_eks_sub_priv_1b.id
}


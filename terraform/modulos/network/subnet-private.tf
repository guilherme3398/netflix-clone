resource "aws_subnet" "netflix_eks_sub_priv_1a" {
  vpc_id            = aws_vpc.netflix_eks_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${data.aws_region.current.name}a" 

  tags = merge(
    var.tags, {
      Name                              = "subnet_private_1a",
      "kubernetes.io/role/internal-elb" = 1
    }
  )

}

resource "aws_subnet" "netflix_eks_sub_priv_1b" {
  vpc_id            = aws_vpc.netflix_eks_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${data.aws_region.current.name}b" 

  tags = merge(
    var.tags, {
      Name                              = "subnet_private_1b",
      "kubernetes.io/role/internal-elb" = 1
    }
  )

}

#-------------- Anexando a route table as subnets privadas

resource "aws_route_table_association" "eks_rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.netflix_eks_sub_priv_1a.id
  route_table_id = aws_route_table.netflix_eks_rtb_priv_1a.id
}

resource "aws_route_table_association" "eks_rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.netflix_eks_sub_priv_1b.id
  route_table_id = aws_route_table.netflix_eks_rtb_priv_1b.id
}
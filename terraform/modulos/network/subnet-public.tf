resource "aws_subnet" "netflix_eks_sub_pub_1a" {
  vpc_id                  = aws_vpc.netflix_eks_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}a" 

  tags = merge(
    var.tags,
    {
      Name                     = "subnet_public_1a",
      "kubernetes.io/role/elb" = 1

    }
  )
}


resource "aws_subnet" "netflix_eks_sub_pub_1b" {
  vpc_id                  = aws_vpc.netflix_eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}b"

  tags = merge(
    var.tags,
    {
      Name                     = "subnet_public_1b",
      "kubernetes.io/role/elb" = 1

    }
  )
}

resource "aws_route_table_association" "netflix_eks_assoc_1a" {
  subnet_id      = aws_subnet.netflix_eks_sub_pub_1a.id
  route_table_id = aws_route_table.netflix_eks_rtb_pub.id
}

resource "aws_route_table_association" "netflix_eks_assoc_1b" {
  subnet_id      = aws_subnet.netflix_eks_sub_pub_1b.id
  route_table_id = aws_route_table.netflix_eks_rtb_pub.id
}

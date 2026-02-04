resource "aws_internet_gateway" "netflix_eks_igw" {
  vpc_id = aws_vpc.netflix_eks_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}

resource "aws_route_table" "netflix_eks_rtb_pub" {
  vpc_id = aws_vpc.netflix_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.netflix_eks_igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-route-table-pub"
    }
  )
}
#-------- ALocando IP Elastico

resource "aws_eip" "netflix_eks_ngw_eip_1a" {

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-eip-1a"
    }
  )
}

resource "aws_eip" "netflix_eks_ngw_eip_1b" {

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-eip-1b"
    }
  )
}

#--- Criando NAT GATEWAY

resource "aws_nat_gateway" "netflix_eks_ngw_1a" {
  allocation_id = aws_eip.netflix_eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.netflix_eks_sub_pub_1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )
}

resource "aws_nat_gateway" "netflix_eks_ngw_1b" {
  allocation_id = aws_eip.netflix_eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.netflix_eks_sub_pub_1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )
}

#--------Criando route table privada e liberando rota do nat gateway

resource "aws_route_table" "netflix_eks_rtb_priv_1a" {
  vpc_id = aws_vpc.netflix_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.netflix_eks_ngw_1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-priv-route-table-1a"
    }
  )
}

resource "aws_route_table" "netflix_eks_rtb_priv_1b" {
  vpc_id = aws_vpc.netflix_eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.netflix_eks_ngw_1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-priv-route-table-1b"
    }
  )
}


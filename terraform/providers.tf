terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }

  backend "s3" {
    bucket = "proj-netflix-clone-bucket"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

# Data sources para acessar o dados do Cluster EKS ""

data "aws_eks_cluster" "cluster" {
  name = module.cluster_eks.eks_name
  depends_on = [
    module.cluster_eks
  ]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.cluster_eks.eks_name
  depends_on = [
    module.cluster_eks
  ]
}


# Kubernetes Provider — usado para aplicar manifests dentro do cluster

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# Helm Provider — usado para instalar charts AWS Load Balancer Controller

provider "helm" {
  kubernetes = {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}




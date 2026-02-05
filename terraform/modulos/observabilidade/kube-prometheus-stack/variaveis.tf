variable "eks_name" {
  type        = string
  description = "Nome do EKS CLUSTER"
}

variable "project_name" {
  type        = string
  description = "nome do projeto para usar nos nomes dos recursos (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags para adicionar aos recursos aws"
}

variable "vpc_id" {
  type        = string
  description = "ID da vpc utilizada no projeto"
}
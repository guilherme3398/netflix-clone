variable "project_name" {
  type        = string
  description = "nome do projeto para usar nos nomes dos recursos (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags para adicionar aos recursos aws"
}

variable "private_subnet_1a" {
  type        = string
  description = "subnet privada 1a para ser utilizada no eks"
}

variable "private_subnet_1b" {
  type        = string
  description = "subnet privada 1b para ser utilizada no eks"
}

variable "eks_name" {
  type        = string
  description = "nome do cluster eks"
}



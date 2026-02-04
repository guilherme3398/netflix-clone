variable "cidr_block" {
  type        = string
  description = "Configuração de range IP para VPC"

}

variable "project_name" {
  type        = string
  description = "nome do projeto para usar nos nomes dos recursos (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags para adicionar aos recursos aws"
}

variable "public_subnet_1a" {
  type        = string
  description = "subnet publica 1a para ser utilizada no eks"
}

variable "public_subnet_1b" {
  type        = string
  description = "subnet publica 1b para ser utilizada no eks"
}

variable "private_subnet_1a" {
  type        = string
  description = "subnet publica 1b para ser utilizada no eks"
}

variable "private_subnet_1b" {
  type        = string
  description = "subnet publica 1b para ser utilizada no eks"
}

variable "node_role_arn" {
  type        = string
  description = "ARN da Role do IAM usada pelo Managed Node Group"
}


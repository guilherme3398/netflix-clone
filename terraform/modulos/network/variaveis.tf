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
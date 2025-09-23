variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string

  validation {
    condition = alltrue([
      can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.vpc_cidr)),            # formato geral CIDR
      tonumber(split("/", var.vpc_cidr)[1]) <= 28,                                 # máscara inferior ou igual a /28
      tonumber(split("/", var.vpc_cidr)[1]) >= 16                                  # máscara superior ou igual a /16
    ])
    error_message = <<EOT
CIDR inválido para VPC.
- Deve estar no formato correto (ex: 10.0.0.0/16)
- Máscara deve estar entre /16 e /28
EOT
  }
}

variable "subnet_cidr" {}
variable "az" {}


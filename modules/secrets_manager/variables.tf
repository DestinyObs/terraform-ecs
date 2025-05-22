variable "secret_name" {
  description = "Name of the secret in Secrets Manager"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}


variable "db_host" { description = "Database host" }
variable "db_port" { description = "Database port" }
variable "api_url" { description = "API URL" }
variable "api_golang_port" { description = "API Golang port" }
variable "delay_ms" { description = "Delay in ms" }
resource "aws_secretsmanager_secret" "db_credentials" {
  name        = var.secret_name
  description = "Environment variables and DB credentials for ${var.environment}"
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id     = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    DATABASE_URL         = "postgres://${var.db_username}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}"
    POSTGRES_USER        = var.db_username
    POSTGRES_PASSWORD    = var.db_password
    POSTGRES_DB          = var.db_name
    API_URL              = var.api_url
    API_GOLANG_PORT      = var.api_golang_port
    DELAY_MS             = var.delay_ms
    MIGRATE_DATABASE_URL = "postgresql://${var.db_username}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}?sslmode=disable"
  })
}
resource "aws_secretsmanager_secret" "db_credentials" {
  name        = "${var.environment}-db-credentials"
  description = "Database credentials for ${var.environment} environment"
}

resource "aws_secretsmanager_secret_version" "db_credentials_version" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = var.db_username,
    password = var.db_password
  })
}

output "db_secrets_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}
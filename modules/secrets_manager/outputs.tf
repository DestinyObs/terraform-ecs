### secrets_manager/outputs.tf

output "db_secrets_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}

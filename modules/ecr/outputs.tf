output "frontend_repo_url" {
  value = aws_ecr_repository.frontend.repository_url
}
output "node_api_repo_url" {
  value = aws_ecr_repository.node_api.repository_url
}
output "go_api_repo_url" {
  value = aws_ecr_repository.go_api.repository_url
}
output "load_generator_repo_url" {
  value = aws_ecr_repository.load_generator.repository_url
}
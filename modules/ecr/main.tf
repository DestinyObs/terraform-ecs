resource "aws_ecr_repository" "frontend" {
  name = "${var.environment}-frontend"
}
resource "aws_ecr_repository" "node_api" {
  name = "${var.environment}-node-api"
}
resource "aws_ecr_repository" "go_api" {
  name = "${var.environment}-go-api"
}
resource "aws_ecr_repository" "load_generator" {
  name = "${var.environment}-load-generator"
}
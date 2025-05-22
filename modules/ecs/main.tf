resource "aws_ecs_cluster" "main" {
  name = "${var.environment}-ecs-cluster"
}
# Add task definitions and services for frontend, node API, go API, load generator here.
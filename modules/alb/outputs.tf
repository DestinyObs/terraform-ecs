output "alb_arn" {
  value = aws_lb.main.arn
}
output "frontend_tg_arn" {
  value = aws_lb_target_group.frontend.arn
}
output "node_api_tg_arn" {
  value = aws_lb_target_group.node_api.arn
}
output "go_api_tg_arn" {
  value = aws_lb_target_group.go_api.arn
}
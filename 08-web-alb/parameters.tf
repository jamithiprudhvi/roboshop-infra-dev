resource "aws_ssm_parameter" "web-alb_listner_arn" {
  name  = "/${var.project_name}/${var.environment}/web-alb_listner_arn"
  type  = "String"
  value = aws_lb_listener.https.arn
}

resource "aws_ssm_parameter" "web-alb_dns_name" {
  name  = "/${var.project_name}/${var.environment}/web-alb_dns_name"
  type  = "String"
  value = aws_lb.web-alb.dns_name
}
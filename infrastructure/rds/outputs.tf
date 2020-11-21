output "k8s-rds-end" {
  value = aws_db_instance.k8s-rds.endpoint
}
output "test-rds-end" {
  value = aws_db_instance.test-rds.endpoint
}
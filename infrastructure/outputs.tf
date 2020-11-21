output "jenkins-ip" {
  value = module.aws_ec2.jenkins-ip
}

output "testvm-ip" {
  value = module.aws_ec2.testvm-ip
}

output "testdb-endpoint" {
  value = module.aws_rds.test-rds-end
}

output "k8sdb-endpoint" {
  value = module.aws_rds.k8s-rds-end
}
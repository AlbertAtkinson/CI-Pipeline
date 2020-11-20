output "sg-id" {
  value = aws_security_group.sg-A.id
}
output "jenkins-ip" {
  value = aws_instance.jenkins.public_ip
}
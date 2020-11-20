output "vpcid" {
  value = aws_vpc.main.id
}

output "sub-A-id" {
  value = aws_subnet.sub-A.id
}

output "sub-B-id" {
  value = aws_subnet.sub-B.id
}
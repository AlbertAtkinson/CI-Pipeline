resource "aws_db_subnet_group" "rds-sub-group" {
  name       = "rds-sub-group"
  subnet_ids = [var.sub-A-id, var.sub-B-id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "test-rds" {
  identifier             = "test-rds"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "testrds"
  username               = var.test-username
  password               = var.test-password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.rds-sub-group.name
  vpc_security_group_ids = [var.sg-A-id]
  tags = {
    Name = "test-rds"
  }
  skip_final_snapshot = true
}
resource "aws_db_instance" "k8s-rds" {
  identifier             = "k8s-rds"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "k8srds"
  username               = var.k8s-username
  password               = var.k8s-password
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.rds-sub-group.name
  vpc_security_group_ids = [var.sg-A-id]
  tags = {
    Name = "k8s-rds"
  }
  skip_final_snapshot = true
}


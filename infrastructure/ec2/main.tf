resource "aws_security_group" "sg-A" {
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = var.open-internet
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.open-internet
  }

  tags = {
    Name = "pipeline-security"
  }
}

resource "aws_key_pair" "terraform-key" {
  key_name   = "terraform-key"
  public_key = var.public-key
}

resource "aws_instance" "jenkins" {
  ami = var.ami
  tags = {
    Name = var.instance-name
  }
  instance_type          = var.instance-type
  key_name               = aws_key_pair.terraform-key.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg-A.id]

  lifecycle {
    create_before_destroy = true
  }
  associate_public_ip_address = var.associate_public_ip_address
}

resource "aws_instance" "test-vm" {
  ami = var.ami
  tags = {
    Name = "test-vm"
  }
  instance_type          = var.instance-type
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.sg-A.id]

  lifecycle {
    create_before_destroy = true
  }
  associate_public_ip_address = var.associate_public_ip_address
}

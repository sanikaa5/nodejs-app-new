provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "node_app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "NodeAppInstance"
  }

  security_groups = [aws_security_group.node_app_sg.name]
}

resource "aws_security_group" "node_app_sg" {
  name        = "node-app-sg"
  description = "Allow SSH, HTTP, Jenkins, and Node.js"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

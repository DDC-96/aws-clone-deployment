resource "aws_key_pair" "dev-key" {
  key_name   = var.priv_key
  public_key = file(var.pub_key)
}

resource "aws_instance" "web" {
  ami                         = lookup(var.ami, var.aws_region) #change ami id for different region
  instance_type               = var.instance_type
  associate_public_ip_address = true # attribute for enabling public IP on instance 
  key_name                    = aws_key_pair.dev-key.key_name
  vpc_security_group_ids      = [aws_security_group.Jenkins-sg.id]
  subnet_id                   = module.vpc.public_subnets[0]
  user_data                   = templatefile("./install-script.tmpl", {})

  tags = {
    Name = "Jenkins-sonarqube"
  }

  root_block_device {
    volume_size = 30
  }
}

resource "aws_security_group" "Jenkins-sg" {
  name        = "Jenkins-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = [var.myIp]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

#provider.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
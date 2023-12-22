provider "aws" {
    region = "us-east-2" 
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance"  "homework_ec2" {
  ami  = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "homework-key"
  availability_zone = "us-east-2a"
  vpc_security_group_ids = [aws_security_group.SG.id]
  user_data = file("apache.sh")
   
   tags = local.common_tags
}

  
resource "aws_security_group" "SG" {
  name        = "homework-sg"
  description = "SG for hw-ec2"


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "hk" {
  key_name   = "homework-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
  

  
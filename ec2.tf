# key-vaue pairs for ec2 instance
resource "aws_key_pair" "new_key" {
  key_name   = "my_new_key"
  public_key = file("new-key-ec2-demo.pub") # Replace with your actual public key
}

# vpc for ec2 instance
resource "aws_default_vpc" "default" {
  
}

# security group for ec2 instance

resource aws_security_group my_security_group {
  name        = "my_security_group"
  description = "Creating a security group for EC2 instance"
  vpc_id      = aws_default_vpc.default.id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
    tags = {
        Name = "my_security_group"
    }
}

# ec2 instance

resource "aws_instance" "my_instance" {
  user_data = file("nginx.sh") # Replace with your actual user data script
  ami           = "ami-0f918f7e67a3323f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.new_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  
  root_block_device {
    volume_size = var.aws_root_volume_size # Size in GB
    volume_type = "gp3" # General Purpose SSD
  }
  tags = {
    Name = "Test_Instance"
  }

}
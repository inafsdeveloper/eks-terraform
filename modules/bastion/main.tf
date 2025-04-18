resource "aws_instance" "bastion" {
#  ami                    = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 in us-west-1 (update as needed)
  ami                    = "ami-020fbc00dbecba358" # Update with the desired AMI
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet
  vpc_security_group_ids = [aws_security_group.bastion.id]
  key_name               = aws_key_pair.bastion.key_name

  tags = {
    Name = "ecommerce-bastion"
  }
}

resource "aws_security_group" "bastion" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_key_pair" "bastion" {
  key_name   = "ecommerce-bastion-key"
  public_key = file("~/.ssh/id_ed25519.pub") # Ensure this file exists
}
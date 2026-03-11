provider "aws" {
  region = "us-east-1"
}

variable "servers" {
  default = {
    server1 = "t3.micro"
    server3 = "t3.micro"
  }
}

resource "aws_instance" "web" {
  for_each = var.servers

  ami           = "ami-0c02fb55956c7d316"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}

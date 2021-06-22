provider "aws" {
  profile  = "default"
  region   = "us-east-2"
}
resource "aws_instance" "React_app" {
    ami                          = "ami-0d8d212151031f51c"
    instance_type                = "t2.micro"
    security_groups              = ["${aws_security_group.React_app.id}"]
    subnet_id                    = "subnet-52e05939"
    tags                         = { "Name" = "ReactApp(Terraform)" }
    key_name                     = "docker-putty"
}
output "public_ip" {
  value = "${aws_instance.React_app.public_dns}"
}

resource "aws_security_group" "React_app" {
  name           = "ReactApp"
  description    = "Allow standard ports"
  ingress {
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    cidr_blocks  =["0.0.0.0/0"]
  }
 ingress {
    from_port    = 3000
    to_port      = 3000
    protocol     = "tcp"
    cidr_blocks  =["0.0.0.0/0"]
  }
 ingress {
    from_port    = 5000
    to_port      = 5000
    protocol     = "tcp"
    cidr_blocks  =["0.0.0.0/0"]
  }
  ingress {
    description  = "SSH"
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  =["0.0.0.0/0"]
  }
  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  =["0.0.0.0/0"]
  }
   tags          = { "Terraform" : "true" } 
}

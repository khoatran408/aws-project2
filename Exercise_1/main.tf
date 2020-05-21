# TODO: Designate a cloud provider, region, and credentials

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2

# TODO: provision 2 m4.large EC2 instances named Udacity M4

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/khoa/.aws/credentials"
}

resource "aws_instance" "Udacity_T2"  {
  count         = "4"
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = {
    name = "Udacity Terraform"
  }
}

resource "aws_instance" "Udacity_M4" {
  count         = "0"
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "m4.large"
  tags = {
    name = "Udacity Terraform"
  }
}
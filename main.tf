terraform {
  backend "s3" {
    bucket = "fiap-fase03-tf"
    key    = "rds/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1" # Defina a região desejada
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

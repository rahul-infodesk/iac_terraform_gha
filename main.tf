terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "remote" {
    organization = "CourageAI"

    workspaces {
      name = "CourageAI-Infrastructure"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami                    = "ami-830c94e3"
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.web-sg.id]

}
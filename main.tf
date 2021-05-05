terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
   tags = {
    Name = "vpc-tf"
  }
}

resource "aws_subnet" "pub01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.0.0/18"
  availability_zone = "us-east-1a"
  tags = {
    Name = "snet-tf-pub-01"
  }
   }

   resource "aws_subnet" "pub02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.64.0/18"
  availability_zone = "us-east-1b"
  tags = {
    Name = "snet-tf-pub-02"
  }
   }

   resource "aws_subnet" "priv01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.128.0/18"
  availability_zone = "us-east-1a"
  tags = {
    Name = "snet-tf-priv-01"
  }
   }
   resource "aws_subnet" "priv02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.192.0/18"
  availability_zone = "us-east-1b"
  tags = {
    Name = "snet-tf-priv-02"
  }
   }
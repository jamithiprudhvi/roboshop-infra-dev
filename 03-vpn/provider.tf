terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "prudhvi-state-prod"
    key    = "vpn"
    region = "us-east-1"
    dynamodb_table = "prudhvi-locking-prod"
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}
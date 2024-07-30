terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58.0"
    }    
  }
  backend "s3" {
    bucket = "sky-s3-main28"
    key    = "s3-1.tfstate"
    region = "us-east-1"
    encrypt = true
    }
}
# Configure aws provider
provider "aws" {
  region = "us-east-1"
}

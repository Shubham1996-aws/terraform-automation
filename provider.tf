terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  region = var.region
  #profile = "default"
  access_key =  var.access_key
  secret_key = var.secret_key
}
# terraform {
#   backend "remote" {
#     hostname     = "app.terraform.io"
#     organization = "HashiCorp-Sam"

#     workspaces {
#       name = "local_execution_test"
#     }
#   }
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "2.99.0"
#     }
#   }
# }

terraform {
  cloud {
    organization = "HashiCorp-Sam"

    workspaces {
      name = "local_execution_test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}


provider "aws" {
  region  = var.region
}

resource "aws_vpc" "hashicat" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true

  tags = {
    name = "${var.prefix}-vpc-${var.region}"
    environment = "Production"
  }
}

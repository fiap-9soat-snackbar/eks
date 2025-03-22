provider "aws" {
  region = data.terraform_remote_state.global.outputs.aws_region
}

terraform {
  #required_version = "~> 1.10.3" 

  backend "s3" {
    region = "us-east-1"
    key    = "global/terraform.tfstate"
  }
}

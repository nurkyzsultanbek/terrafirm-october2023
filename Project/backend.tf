terraform {
  backend "s3" {
    bucket = "nurkyz"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
  }
}
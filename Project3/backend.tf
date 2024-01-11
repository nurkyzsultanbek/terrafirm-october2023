terraform {
  backend "s3" {
    bucket = "nurkyz"
    key    = "statefiles/terraform.tfstate"
    region = var.region
  }
}
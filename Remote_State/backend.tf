terraform {
  backend "s3"{
    bucket                 = "myterraformsandbox"
    region                 = "us-east-1"
    key                    = "backend.tfstate"
    dynamodb_table         = "myterraformsandbox"
  }
}
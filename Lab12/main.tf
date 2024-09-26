terraform {
  backend "s3" {
    bucket = "vup-communication-test"
    key    = "/Source/DevOpsAssignment/Lab12/terraform.tfstate"
    region = "ap-northeast-1"
    encrypt = true
  }
}

#Provider Block
provider "aws" {
    profile = "default"
    region = "ca-central-1"
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "SSMRoleForEC2"
}

#Resources Block
resource "aws_instance" "TF_app_server" {
ami = "ami-074c42dd5ddb28c14"
instance_type = "t2.micro"
iam_instance_profile = aws_iam_instance_profile.test_profile.name
tags ={
    Name = "TF_EC2_app_server"
    Owner ="Jose Lavado"
    project = "Terraform"
}

}

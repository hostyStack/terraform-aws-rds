#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-46c1b650"
    us-west-2 = "ami-f4533694"
    eu-west-1 = "ami-061b1560"
    eu-west-2 = "ami-e05a4d84"
    eu-central-1 = "ami-fa2df395"
  }
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "hosty-ireland-key"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "hosty-ireland-key.pub"
}

variable "RDS_PASSWORD" {}

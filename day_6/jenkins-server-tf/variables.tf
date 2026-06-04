variable "project_name" {
  type = string
  default = "devops_day_6"
}

variable vpc_cidr{
  type = string
  default = "10.0.0.0/16"
}

variable public_subnet{
  type = string
  default = "10.0.1.0/24"
}

variable "key_name" {
  type = string
  default = "devops"
}

variable "iam_role" {
  type = string
  default = "Jenkins-iam-role"

}

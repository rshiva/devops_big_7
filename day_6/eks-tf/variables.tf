variable "project_name" {
  type = string
  default = "devops_day_6"
}

variable vpc_cidr{
  type = string
  default = "10.0.0.0/16"
}

variable public_subnet_name{
  type = string
  default = "devops_day_6-subnet"
}

variable "key_name" {
  type = string
  default = "devops-project"
}

variable "iam_role" {
  type = string
  default = "Jenkins-iam-role"

}

variable "day_6_igw"{
  type = string
  default = "devops_day_6-igw"
}

variable "security_groups_name"{
  default = "devops_day_6-security_groups"
}

variable "eksnode-group-name" {
  default = "Eks-Node-Group"
}

variable "cluster-name"{
  default = "eks-reddit-cluster"
}

variable "access_key" {
  type    = string
}

variable "secret_key" {
  type    = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ashu-availability_zones" {
  default = ["us-east-1b", "us-east-1a"]
}

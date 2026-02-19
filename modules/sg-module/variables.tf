variable "name" {
  type = string
}

variable "http_cidr" {
  type = list(string)
}

variable "ssh_cidr" {
  type = list(string)
}

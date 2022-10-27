
variable "bucket_name"{
  type = string
  default = "test-terraform-bucket123213123312321"
}

variable "access_key" {
  type = string
  default = ""
}

variable "secret_key" {
  type = string
  default = ""
}

variable "domain_name" {
    type = "string"
    default = "test"
}
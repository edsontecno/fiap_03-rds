variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  default     = "root"
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "eds12345678"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

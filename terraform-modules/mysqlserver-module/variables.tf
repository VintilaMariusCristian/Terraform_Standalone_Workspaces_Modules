// Resource Group

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

// MYSQL + FW vars

variable "mysql_server_name" {
  type        = string
  description = "MySQL Server resource name"
}


variable "mysql_admin_username" {
  type      = string
  sensitive = true
}

variable "mysql_admin_password" {
  type      = string
  sensitive = true
}

variable "mysql_db_name" {
  type        = string
  description = "MySQL DB resource name"
}

variable "mysql_start_ip" {
  type        = string
  description = "MySQL Server ip address"
  sensitive   = true
}

variable "mysql_end_ip" {
  type        = string
  description = "MySQL Server ip address"
  sensitive   = true
}

variable "fw_name" {
  type        = string
  description = "Fw rule resource name"
}



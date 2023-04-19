variable "db_name" {

 default     = "B_Gen5_1"
 }

variable "db_sku_name" {
  description = "Name of the SKU "

  default     = "B_Gen5_1"
}

variable "db_storage_mb" {

  default     = 5120
}

variable "db_username" {

  default = "jagjit.singh"
}

variable "db_password" {
  default = "J@gjit1998"
}

variable "resource_group_name"{
   type = string
}


variable "location"{}
variable "prefix"{}

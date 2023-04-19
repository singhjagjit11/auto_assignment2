variable "vm_count" {
 type = string
}

variable "location" {
 type = string
}

variable "resource_group_name" {
 type = string
}

variable "subnet_id" {
 type = string
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "jagjit.singh"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
variable "linux_vm_ids" {
  type = list(string)
}

variable "vmwindows_vm_id" {
  type = string
}

variable "disk_size" {
    default = 10
}

variable "lun" {
    default = 0
}
variable "client_id" {
  type        = string
    sensitive= true 
}
variable "client_secret" {
  type        = string
    sensitive= true 
}
variable "tenant_id" {
  type        = string
    sensitive= true 
}
variable "subscription_id" {
  type        = string
    sensitive= true 
}

variable "resource_group" {
  type        = string
  default = "chandraPacker"
}
variable "gallery_name" {
  type        = string
  default = "ACEITCLOUD"
}
variable "image_name" {
  type        = string
  default = "Windows2019"
}
variable "image_version" {
  type    = string
  default = "1.0.1"
}
variable "os_type" {
  type        = string
  default = "Windows"
}
variable "image_publisher" {
  type        = string
  default = "MicrosoftWindowsServer"
}
variable "image_offer" {
  type        = string
  default = "WindowsServer"
}
variable "image_sku" {
  type        = string
  default = "2019-datacenter-gensecond"
}
variable "location" {
  type    = string
  default = "East Us"
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}
variable "winrm_username" {
  type        = string
    sensitive= true 
}
variable "winrm_password" {
  type        = string
  sensitive= true 
}
variable "winrm_timeout" {
  type        = string
  default = "2hr"
}
variable "managed_image_resource_group_name" {
  type        = string
  default = "chandraPacker"
}

variable "business_division" {
  description = "Business Division in the large org this infra belongs to."
  type        = string
  default     = "fth=sap"
}

variable "environment" {
  description = "Env vars used as a prefix"
  default     = "dev"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "fth-rg"
}

variable "resource_group_location" {
  description = "Region in which azure resource to be created"
  default     = "germanynorth"
}

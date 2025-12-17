variable "project_name" {
  type        = string
  description = "The project name"
}

variable "description" {
  type        = string
  description = "A description for this Project"
  default     = "This project was created by Terraform - Do not edit!"
}

variable "basename" {
  type        = string
  description = "Machine naming template for this project"
}

variable "cloud_zone_ids" {
  type        = list(string)
  description = "List of cloud zone IDs to assign to the project"
}

variable "administrator_roles" {
  type = list(object({
    email = string
    type  = string # USER or GROUP
  }))
  description = "Administrators assigned to the project (users or groups)"
  default     = []
}

variable "member_roles" {
  type = list(object({
    email = string
    type  = string # USER or GROUP
  }))
  description = "Members assigned to the project (users or groups)"
  default     = []
}

variable "supervisor_roles" {
  type = list(object({
    email = string
    type  = string # USER or GROUP
  }))
  description = "Supervisors assigned to the project (users or groups)"
  default     = []
}

variable "viewer_roles" {
  type = list(object({
    email = string
    type  = string # USER or GROUP
  }))
  description = "Viewers assigned to the project (users or groups)"
  default     = []
}

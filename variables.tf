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

variable "placement_policy" {
  type        = string
  description = "Placement policy applied when selecting a cloud zone for provisioning. Valid values are DEFAULT or SPREAD."
  default     = "DEFAULT"

  validation {
    condition     = contains(["DEFAULT", "SPREAD"], var.placement_policy)
    error_message = "placement_policy must be one of: DEFAULT or SPREAD."
  }
}

variable "roles" {
  description = "All users or groups must be defined in email/UPN format as expected by the identity provider"
  type = object({
    administrators = list(object({
      email = string
      type  = string
    }))
    members = list(object({
      email = string
      type  = string
    }))
    supervisors = list(object({
      email = string
      type  = string
    }))
    viewers = list(object({
      email = string
      type  = string
    }))
  })
  validation {
    condition = alltrue(flatten([
      for _, role_list in var.roles :
      [for r in role_list : contains(["USER", "GROUP"], r.type)]
    ]))
    error_message = "All role types must be USER or GROUP"
  }
  default = {
    administrators = []
    members        = []
    supervisors    = []
    viewers        = []
  }
}

variable "constraints" {
  type = object({
    extensibility = list(object({
      expression = string
      mandatory  = bool
    }))
    network = list(object({
      expression = string
      mandatory  = bool
    }))
    storage = list(object({
      expression = string
      mandatory  = bool
    }))
  })

  default = {
    extensibility = []
    network       = []
    storage       = []
  }

  description = "Provisioning constraints applied to the project"
}

variable "shared_resources" {
  type        = bool
  default     = false
  description = "Determines if resources are visble only to the owner of them."
}
variable "operation_timeout" {
  type        = string
  default     = 6000
  description = "Execution timeout for the project"
}

variable "custom_properties" {
  type        = map(string)
  description = "Custom properties applied to all requests in this project"
  default     = {}
}

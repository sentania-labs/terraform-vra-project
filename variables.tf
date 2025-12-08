
variable "project_name" {
  type        = string
  description = "The project name"
}
variable "description" {
  type        = string
  description = "A description for this Project"
  default     = "This project was created by TF - Do not edit!"
}
variable "administrators" {
  type        = list(string)
  description = "List of administrator principals for the project (UPN Format)"
}
variable "basename" {
  type        = string
  description = "Naming schema for this project to enforce"
}

variable "cloud_zone_ids" {
  type        = list(string)
  description = "List of cloud zone IDs to assign to the project"
}

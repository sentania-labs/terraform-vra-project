
variable "project_name" {
  type = string
}
variable "description" {
  type = string
}
variable "basename" {
  type = string
}

variable "cloud_zone_ids" {
  type        = list(string)
  description = "List of cloud zone IDs to assign to the project"
}

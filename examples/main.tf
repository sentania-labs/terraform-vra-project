terraform {
  required_providers {
    vra = {
      source  = "vmware/vra"
      version = ">= 0.15.0"
    }
  }
  required_version = ">= 1.6.6"
}

module "project" {
  source      = "../../"
  name        = var.project_name
  description = var.description

  administrators = var.administrators
  members        = var.members
  basename       = var.basename
  cloud_zone_ids = var.cloud_zone_ids
}

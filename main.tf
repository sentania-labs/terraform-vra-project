resource "vra_project" "this" {
  name                    = var.project_name
  description             = var.description
  shared_resources        = false
  operation_timeout       = 6000
  machine_naming_template = var.basename
  placement_policy        = "SPREAD"

  dynamic "zone_assignments" {
    for_each = var.cloud_zone_ids
    content {
      zone_id  = zone_assignments.value
      priority = 100
    }
  }

  dynamic "administrator_roles" {
    for_each = var.administrator_roles
    content {
      email = administrator_roles.value.email
      type  = administrator_roles.value.type
    }
  }

  dynamic "member_roles" {
    for_each = var.member_roles
    content {
      email = member_roles.value.email
      type  = member_roles.value.type
    }
  }

  dynamic "supervisor_roles" {
    for_each = var.supervisor_roles
    content {
      email = supervisor_roles.value.email
      type  = supervisor_roles.value.type
    }
  }

  dynamic "viewer_roles" {
    for_each = var.viewer_roles
    content {
      email = viewer_roles.value.email
      type  = viewer_roles.value.type
    }
  }
}

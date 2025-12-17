resource "vra_project" "this" {
  name                    = var.project_name
  description             = var.description
  shared_resources        = var.shared_resources
  operation_timeout       = var.operation_timeout
  machine_naming_template = var.basename
  placement_policy        = var.placement_policy
  custom_properties       = var.custom_properties

  dynamic "zone_assignments" {
    for_each = var.cloud_zone_ids
    content {
      zone_id  = zone_assignments.value
      priority = 100
    }
  }

  dynamic "administrator_roles" {
    for_each = var.roles.administrators
    content {
      email = administrator_roles.value.email
      type  = administrator_roles.value.type
    }
  }

  dynamic "member_roles" {
    for_each = var.roles.members
    content {
      email = member_roles.value.email
      type  = member_roles.value.type
    }
  }

  dynamic "supervisor_roles" {
    for_each = var.roles.supervisors
    content {
      email = supervisor_roles.value.email
      type  = supervisor_roles.value.type
    }
  }

  dynamic "viewer_roles" {
    for_each = var.roles.viewers
    content {
      email = viewer_roles.value.email
      type  = viewer_roles.value.type
    }
  }

  dynamic "constraints" {
    for_each = (
      length(var.constraints.extensibility) > 0 ||
      length(var.constraints.network) > 0 ||
      length(var.constraints.storage) > 0
    ) ? [1] : []

    content {

      dynamic "extensibility" {
        for_each = var.constraints.extensibility
        content {
          expression = extensibility.value.expression
          mandatory  = extensibility.value.mandatory
        }
      }

      dynamic "network" {
        for_each = var.constraints.network
        content {
          expression = network.value.expression
          mandatory  = network.value.mandatory
        }
      }

      dynamic "storage" {
        for_each = var.constraints.storage
        content {
          expression = storage.value.expression
          mandatory  = storage.value.mandatory
        }
      }
    }
  }

}
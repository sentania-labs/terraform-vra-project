terraform {
  required_providers {
    vra = {
      source  = "vmware/vra"
      version = ">= 0.15.0"
    }
  }
  required_version = ">= 1.14.0"
}

module "project" {
  source = "../"

  project_name     = var.project_name
  description      = var.description
  basename         = var.basename
  placement_policy = "SPREAD"
  cloud_zone_ids   = var.cloud_zone_ids
  custom_properties = {
    foo  = "bar"
    foo2 = "bar2"
  }

  constraints = {
    extensibility = [
      {
        expression = "foo:bar"
        mandatory  = false
      },
      {
        expression = "environment:test"
        mandatory  = true
      }
    ]

    network = [
      {
        expression = "foo:bar"
        mandatory  = false
      },
      {
        expression = "environment:test"
        mandatory  = true
      }
    ]

    storage = [
      {
        expression = "foo:bar"
        mandatory  = false
      },
      {
        expression = "environment:test"
        mandatory  = true
      }
    ]
  }

  roles = {
    administrators = [
      {
        email = "vcf-admins@corp.local"
        type  = "GROUP"
      }
    ]

    members = [
      {
        email = "dev-team@corp.local"
        type  = "GROUP"
      },
      {
        email = "scott@corp.local"
        type  = "USER"
      }
    ]

    supervisors = []

    viewers = [
      {
        email = "security-audit@corp.local"
        type  = "GROUP"
      }
    ]
  }
}

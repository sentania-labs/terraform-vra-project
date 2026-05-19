# terraform-vra-project

This module provides a complete, opinionated implementation of the
[`vra_project`](https://registry.terraform.io/providers/vmware/vra/latest/docs/resources/vra_project)
resource.

It exposes all commonly used project capabilities including:

- Cloud zone assignment
- Placement policy
- Role-based access control (RBAC) for users and groups
- Project-level provisioning constraints
- Custom properties applied to all requests

Cloud zones are currently assigned uniformly to projects. Placement should be
steered using constraint tags until cloud account / cloud zone layering is
introduced in a future version.

---

## Usage example

```hcl
module "project" {
  source = "sentania-labs/vmapps-project/vra"

  project_name = "Finance-Prod"
  basename     = "fin-${count.index}"

  cloud_zone_ids = [
    "b1b6c0f5-aaaa-bbbb-cccc-111111111111"
  ]

  placement_policy = "SPREAD"

  custom_properties = {
    managedBy  = "terraform"
    costCenter = "finance"
  }

  constraints = {
    extensibility = [
      {
        expression = "environment:prod"
        mandatory  = true
      }
    ]
    network = []
    storage = []
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
        email = "finance-team@corp.local"
        type  = "GROUP"
      }
    ]
    supervisors = []
    viewers     = []
  }
}
```

---

## Role assignments

Role assignments are managed using the `roles` object and support both users and
groups. The `type` field must be one of:

- `USER`
- `GROUP`

The `email` value must match an identifier resolvable by the configured vRA
Identity Provider (for example, an AD UPN or group name).

---

## Constraints

Constraints allow steering placement across extensibility, network, and storage
dimensions. Multiple constraints of each type are supported. If no constraints
are defined, the project is created without constraint blocks.

---

### Contact

scott.bowe@broadcom.com / scottb@sentania.net

---

## LICENSE

MIT

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_vra"></a> [vra](#requirement\_vra) | >= 0.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vra"></a> [vra](#provider\_vra) | >= 0.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vra_project.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basename"></a> [basename](#input\_basename) | Machine naming template for this project | `string` | n/a | yes |
| <a name="input_cloud_zone_ids"></a> [cloud\_zone\_ids](#input\_cloud\_zone\_ids) | List of cloud zone IDs to assign to the project | `list(string)` | n/a | yes |
| <a name="input_constraints"></a> [constraints](#input\_constraints) | Provisioning constraints applied to the project | <pre>object({<br/>    extensibility = list(object({<br/>      expression = string<br/>      mandatory  = bool<br/>    }))<br/>    network = list(object({<br/>      expression = string<br/>      mandatory  = bool<br/>    }))<br/>    storage = list(object({<br/>      expression = string<br/>      mandatory  = bool<br/>    }))<br/>  })</pre> | <pre>{<br/>  "extensibility": [],<br/>  "network": [],<br/>  "storage": []<br/>}</pre> | no |
| <a name="input_custom_properties"></a> [custom\_properties](#input\_custom\_properties) | Custom properties applied to all requests in this project | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | A description for this Project | `string` | `"This project was created by Terraform - Do not edit!"` | no |
| <a name="input_operation_timeout"></a> [operation\_timeout](#input\_operation\_timeout) | Execution timeout for the project | `string` | `6000` | no |
| <a name="input_placement_policy"></a> [placement\_policy](#input\_placement\_policy) | Placement policy applied when selecting a cloud zone for provisioning. Valid values are DEFAULT or SPREAD. | `string` | `"DEFAULT"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | All users or groups must be defined in email/UPN format as expected by the identity provider | <pre>object({<br/>    administrators = list(object({<br/>      email = string<br/>      type  = string<br/>    }))<br/>    members = list(object({<br/>      email = string<br/>      type  = string<br/>    }))<br/>    supervisors = list(object({<br/>      email = string<br/>      type  = string<br/>    }))<br/>    viewers = list(object({<br/>      email = string<br/>      type  = string<br/>    }))<br/>  })</pre> | <pre>{<br/>  "administrators": [],<br/>  "members": [],<br/>  "supervisors": [],<br/>  "viewers": []<br/>}</pre> | no |
| <a name="input_shared_resources"></a> [shared\_resources](#input\_shared\_resources) | Determines if resources are visible only to the owner of them. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project"></a> [project](#output\_project) | An object that allows referencing to the Automation Project created by name or id |
<!-- END_TF_DOCS -->

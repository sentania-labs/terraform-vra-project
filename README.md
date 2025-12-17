# terraform-vra-vmapps-project

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

scott.bowe@broadcom.com / scottb@sentania.nte

---

## LICENSE

MIT

---

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

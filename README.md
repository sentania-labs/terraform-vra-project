# terraform-vra-vmapps-project

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
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
| <a name="input_administrators"></a> [administrators](#input\_administrators) | List of administrator principals for the project (UPN Format) | `list(string)` | n/a | yes |
| <a name="input_basename"></a> [basename](#input\_basename) | Naming schema for this project to enforce | `string` | n/a | yes |
| <a name="input_cloud_zone_ids"></a> [cloud\_zone\_ids](#input\_cloud\_zone\_ids) | List of cloud zone IDs to assign to the project | `list(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | A description for this Project | `string` | `"This project was created by TF - Do not edit!"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project"></a> [project](#output\_project) | An object that allows referencing to the Automation Project created by name or id |
<!-- END_TF_DOCS -->
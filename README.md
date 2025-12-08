# terraform-vra-vmapps-project

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_vra"></a> [vra](#requirement\_vra) | >= 0.3.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vra"></a> [vra](#provider\_vra) | >= 0.3.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vra_project.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrators"></a> [administrators](#input\_administrators) | List of administrator principals for the project | `list(string)` | n/a | yes |
| <a name="input_basename"></a> [basename](#input\_basename) | n/a | `string` | n/a | yes |
| <a name="input_cloud_zone_ids"></a> [cloud\_zone\_ids](#input\_cloud\_zone\_ids) | List of cloud zone IDs to assign to the project | `list(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project"></a> [project](#output\_project) | n/a |
<!-- END_TF_DOCS -->
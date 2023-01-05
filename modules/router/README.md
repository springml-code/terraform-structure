<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.27, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | ~> 0.4 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bgp"></a> [bgp](#input\_bgp) | BGP information specific to this router. | `any` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | An optional description of this resource | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the router | `string` | n/a | yes |
| <a name="input_nats"></a> [nats](#input\_nats) | NATs to deploy on this router. | `any` | `[]` | no |
| <a name="input_network"></a> [network](#input\_network) | A reference to the network to which this router belongs | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project ID to deploy to | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the router resides | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_router"></a> [router](#output\_router) | The created router |
<!-- END_TF_DOCS -->
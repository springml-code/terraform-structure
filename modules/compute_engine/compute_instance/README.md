<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.43, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute_instance"></a> [compute\_instance](#module\_compute\_instance) | terraform-google-modules/vm/google//modules/compute_instance | 7.9.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_config"></a> [access\_config](#input\_access\_config) | Access configurations, i.e. IPs via which the VM instance can be accessed via the Internet. | <pre>list(object({<br>    nat_ip       = string<br>    network_tier = string<br>  }))</pre> | `[]` | no |
| <a name="input_add_hostname_suffix"></a> [add\_hostname\_suffix](#input\_add\_hostname\_suffix) | Adds a suffix to the hostname | `bool` | `false` | no |
| <a name="input_alias_ip_ranges"></a> [alias\_ip\_ranges](#input\_alias\_ip\_ranges) | (Optional) An array of alias IP ranges for this network interface. Can only be specified for network interfaces on subnet-mode networks. | <pre>list(object({<br>    ip_cidr_range         = string<br>    subnetwork_range_name = string<br>  }))</pre> | `[]` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Enable deletion protection on this instance. Note: you must disable deletion protection before removing the resource, or the instance cannot be deleted and the Terraform run will not complete successfully. | `bool` | `false` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of instances | `string` | `""` | no |
| <a name="input_hostname_suffix_separator"></a> [hostname\_suffix\_separator](#input\_hostname\_suffix\_separator) | Separator character to compose hostname when add\_hostname\_suffix is set to true. | `string` | `"-"` | no |
| <a name="input_instance_template"></a> [instance\_template](#input\_instance\_template) | Instance template self\_link used to create compute instances | `any` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | Network to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| <a name="input_num_instances"></a> [num\_instances](#input\_num\_instances) | Number of instances to create. This value is ignored if static\_ips is provided. | `string` | `"1"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the instances should be created. | `string` | `null` | no |
| <a name="input_resource_policies"></a> [resource\_policies](#input\_resource\_policies) | (Optional) A list of short names or self\_links of resource policies to attach to the instance. Modifying this list will cause the instance to recreate. Currently a max of 1 resource policy is supported. | `list(string)` | `[]` | no |
| <a name="input_static_ips"></a> [static\_ips](#input\_static\_ips) | List of static IPs for VM instances | `list(string)` | `[]` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | Subnet to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| <a name="input_subnetwork_project"></a> [subnetwork\_project](#input\_subnetwork\_project) | The project that subnetwork belongs to | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_available_zones"></a> [instance\_available\_zones](#output\_instance\_available\_zones) | List of available zones in region |
| <a name="output_instance_details"></a> [instance\_details](#output\_instance\_details) | List of all details for compute instances |
| <a name="output_instance_self_links"></a> [instance\_self\_links](#output\_instance\_self\_links) | List of self-links for compute instances |
<!-- END_TF_DOCS -->
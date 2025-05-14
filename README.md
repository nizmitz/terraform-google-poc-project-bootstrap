# terraform-google-poc-project-bootstrap
bootstrap all necessary things for a poc

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.8.0, < 7 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.7.2 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_storage_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_string.terraform_state](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | Terraform State bucket location | `string` | `"ASIA-SOUTHEAST2"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id of the project that holds the network. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the project that is hosted. | `string` | `"asia-southeast2"` | no |
| <a name="input_service_list"></a> [service\_list](#input\_service\_list) | default enabled services | `set(string)` | <pre>[<br/>  "iam.googleapis.com",<br/>  "compute.googleapis.com",<br/>  "container.googleapis.com",<br/>  "iamcredentials.googleapis.com",<br/>  "recommender.googleapis.com",<br/>  "storage-api.googleapis.com",<br/>  "stackdriver.googleapis.com",<br/>  "sqladmin.googleapis.com"<br/>]</pre> | no |
| <a name="input_user_grant_map"></a> [user\_grant\_map](#input\_user\_grant\_map) | IAM Grant member non authoritative | `map(string)` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone of the project that is hosted. | `string` | `"a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_terraform_state_bucket_id"></a> [terraform\_state\_bucket\_id](#output\_terraform\_state\_bucket\_id) | n/a |
| <a name="output_zone"></a> [zone](#output\_zone) | n/a |
<!-- END_TF_DOCS -->

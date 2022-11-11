## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app"></a> [app](#module\_app) | git::https://github.com/s1l0uk/terraform-aws-application.git | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | app name to be deployed | `any` | n/a | yes |
| <a name="input_app_port"></a> [app\_port](#input\_app\_port) | app port to serve | `number` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | AZs to deploy in | `list` | <pre>[<br>  "a",<br>  "b",<br>  "c"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `"eu-west-1"` | no |
| <a name="input_build_command"></a> [build\_command](#input\_build\_command) | Any commands needed to build the application before deploy | `string` | `"npm install; ng build --prod"` | no |
| <a name="input_code_sources"></a> [code\_sources](#input\_code\_sources) | Code sources to deploy to lambd | `list` | <pre>[<br>  "https://github.com/s1l0uk/dummy-angular-app"<br>]</pre> | no |
| <a name="input_create_dns"></a> [create\_dns](#input\_create\_dns) | Should we create the DNS with the deploy | `bool` | `true` | no |
| <a name="input_database_engine"></a> [database\_engine](#input\_database\_engine) | Which database to use for RDS | `string` | `"mysql"` | no |
| <a name="input_database_instance_type"></a> [database\_instance\_type](#input\_database\_instance\_type) | Which database class to use for RDS | `string` | `"db.t4g.micro"` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | Which database version to use for RDS | `string` | `"8.0"` | no |
| <a name="input_deploy_method"></a> [deploy\_method](#input\_deploy\_method) | Method to deploy your application through | `string` | `"fargate"` | no |
| <a name="input_enable_ssl"></a> [enable\_ssl](#input\_enable\_ssl) | Should we Create SSL certificates with ACM | `bool` | `true` | no |
| <a name="input_entry_point"></a> [entry\_point](#input\_entry\_point) | Entry point for Lambda functions | `string` | `"dummy-angular-app.lambda_handler"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A Map of environment variables to go with deployment of the application | `map` | `{}` | no |
| <a name="input_health_check_path"></a> [health\_check\_path](#input\_health\_check\_path) | The path that should be used to for the load balancer to health check against | `string` | `"/health"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The Hostname to use when running the app | `any` | n/a | yes |
| <a name="input_lambda_app_language"></a> [lambda\_app\_language](#input\_lambda\_app\_language) | lambda runtime to be used | `string` | `"python3.8"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | [Optional] Extra Tags to add to your stack. | `map` | <pre>{<br>  "enviroment": "alpha"<br>}</pre> | no |
| <a name="input_website_code_sources"></a> [website\_code\_sources](#input\_website\_code\_sources) | Website Code sources to deploy to lambd | `list` | <pre>[<br>  "https://github.com/s1l0uk/dummy-angular-app"<br>]</pre> | no |

## Outputs

No outputs.

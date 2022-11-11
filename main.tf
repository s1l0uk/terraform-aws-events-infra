//Gets the base if we don't have one!

module "app" {
  source = "git::https://github.com/s1l0uk/terraform-aws-application.git"
  app_name               = var.app_name
  app_port               = var.app_port
  database_engine        = var.database_engine
  database_version       = var.database_version
  lambda_app_language    = var.lambda_app_language
  deploy_method          = var.deploy_method
  tags                   = var.tags
  availability_zones     = var.availability_zones
  code_sources           = var.code_sources
  entry_point            = var.entry_point
  website_code_sources   = var.website_code_sources
  hostname               = var.hostname
  build_command          = var.build_command
  health_check_path      = var.health_check_path
  environment_variables  = var.environment_variables
  aws_region             = var.aws_region
  database_instance_type = var.database_instance_type
  create_dns             = var.create_dns
  enable_ssl             = var.enable_ssl
}

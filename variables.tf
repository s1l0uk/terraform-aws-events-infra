//App Secific
variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "hostname" {
  description = "The Hostname to use when running the app"
}

variable "app_name" {
  description = "app name to be deployed"
}

variable "app_port" {
  description = "app port to serve"
  type        = number
}

variable "database_engine" {
  description = "Which database to use for RDS"
  default     = "mysql"
}

variable "database_version" {
  description = "Which database version to use for RDS"
  default     = "8.0"
}

variable "database_instance_type" {
  description = "Which database class to use for RDS"
  default     = "db.t4g.micro"
}

variable "lambda_app_language" {
  description = "lambda runtime to be used"
  default     = "python3.8"
}

variable "deploy_method" {
  description = "Method to deploy your application through"
  default     = "fargate"
}

variable "tags" {
  description = "[Optional] Extra Tags to add to your stack."
  type        = map
  default = {
    enviroment = "alpha"
  }
}

variable "availability_zones" {
  description = "AZs to deploy in"
  default     = ["a", "b", "c"]
}

variable "code_sources" {
  description = "Code sources to deploy to lambd"
  default     = ["https://github.com/s1l0uk/dummy-angular-app"]
}

variable "website_code_sources" {
  description = "Website Code sources to deploy to lambd"
  default     = ["https://github.com/s1l0uk/dummy-angular-app"]
}

variable "entry_point" {
  description = "Entry point for Lambda functions"
  default     = "dummy-angular-app.lambda_handler"
}

variable "build_command" {
  description = "Any commands needed to build the application before deploy"
  default     = "npm install; ng build --prod"
}

variable "health_check_path" {
  description = "The path that should be used to for the load balancer to health check against"
  default     = "/health"
}

variable "environment_variables" {
  description = "A Map of environment variables to go with deployment of the application"
  default = {}
}

variable "create_dns" {
  description = "Should we create the DNS with the deploy"
  default     = true
}

variable "enable_ssl" {
  description = "Should we Create SSL certificates with ACM"
  default     = true
}

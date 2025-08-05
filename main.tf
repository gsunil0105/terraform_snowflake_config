terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.sf_user
  role              = "SYSADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(var.private_key_path)
}

provider "snowflake" {
  alias             = "useradmin"
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.sf_user
  role              = "USERADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(var.private_key_path)
}

# Modules
module "database" {
  source         = "./modules/database"
  database_name  = var.database_name
}

module "warehouse" {
  source         = "./modules/warehouse"
  warehouse_name = var.warehouse_name
  warehouse_size = var.warehouse_size
}

module "schema" {
  source          = "./modules/schema"
  database_name   = module.database.database_name
  schema_name     = var.schema_name
}

module "role" {
  source       = "./modules/role"
  role_name    = var.role_name
  providers = {
    snowflake = snowflake.useradmin
  }
}

# User and Key
resource "tls_private_key" "svc_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "user" {
  source          = "./modules/user"
  user_name       = var.user_name
  role_name       = module.role.role_name
  warehouse_name  = module.warehouse.warehouse_name
  database_name   = module.database.database_name
  schema_name     = module.schema.schema_name
  rsa_public_key = tls_private_key.svc_key.public_key_pem
  providers = {
    snowflake = snowflake.useradmin
  }
}

module "privileges" {
  source          = "./modules/privileges"
  role_name       = module.role.role_name
  database_name   = module.database.database_name
  schema_name     = module.schema.schema_name
  providers = {
    snowflake = snowflake.useradmin
  }
}
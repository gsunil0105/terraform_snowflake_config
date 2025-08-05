terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_account_role" "role" {
  name     = var.role_name
  comment  = "Created by Terraform"
}

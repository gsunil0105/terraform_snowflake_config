terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "grant_usage_db" {
  privileges        = ["USAGE"]
  account_role_name = var.role_name
  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "grant_usage_schema" {
  privileges        = ["USAGE"]
  account_role_name = var.role_name
  on_schema {
    schema_name = "${var.database_name}.${var.schema_name}"
  }
}
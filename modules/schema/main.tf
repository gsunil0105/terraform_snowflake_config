terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_schema" "schema" {
  name                = var.schema_name
  database            = var.database_name
  with_managed_access = false
}

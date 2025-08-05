terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}


resource "snowflake_database" "database" {
  name         = var.database_name
  is_transient = false
}
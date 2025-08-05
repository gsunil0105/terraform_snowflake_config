terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

resource "snowflake_user" "user" {
  name              = var.user_name
  default_warehouse = var.warehouse_name
  default_role      = var.role_name
  default_namespace = "${var.database_name}.${var.schema_name}"
  rsa_public_key    = var.rsa_public_key
}
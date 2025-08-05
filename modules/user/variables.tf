variable "user_name" {
  description = "Name of the Snowflake user"
  type        = string
}

variable "role_name" {
  description = "Default role for the Snowflake user"
  type        = string
}

variable "warehouse_name" {
  description = "Default warehouse for the Snowflake user"
  type        = string
}

variable "database_name" {
  description = "Database for the Snowflake user"
  type        = string
}

variable "schema_name" {
  description = "Schema for the Snowflake user"
  type        = string
}

variable "rsa_public_key" {
  description = "Public RSA key for the Snowflake user"
  type        = string
}
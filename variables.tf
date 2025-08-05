variable "organization_name" {
  description = "Snowflake organization name"
  type        = string
}

variable "account_name" {
  description = "Snowflake account name"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file for Snowflake authentication"
  type        = string
}

variable "sf_user" {
  description = "Username with the SYSADMIN role"
  type        = string
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "warehouse_name" {
  description = "Name of the warehouse to create"
  type        = string
}

variable "warehouse_size" {
  description = "Size of the warehouse (e.g., XSMALL, SMALL)"
  type        = string
}

variable "schema_name" {
  description = "Name of the schema to create"
  type        = string
}

variable "role_name" {
  description = "Name of the Snowflake role"
  type        = string
}

variable "user_name" {
  description = "Name of the Snowflake user to create"
  type        = string
}
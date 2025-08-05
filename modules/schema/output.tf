output "schema_name" {
  description = "Name of the created Snowflake schema"
  value       = snowflake_schema.schema.name
}
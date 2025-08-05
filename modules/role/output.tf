output "role_name" {
  description = "Name of the created Snowflake role"
  value       = snowflake_account_role.role.name
}
output "user_name" {
  description = "Name of the created Snowflake user"
  value       = snowflake_user.user.name
}
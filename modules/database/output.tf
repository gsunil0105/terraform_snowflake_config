output "database_name" {
  description = "Name of the database created"
  value       = snowflake_database.database.name
}
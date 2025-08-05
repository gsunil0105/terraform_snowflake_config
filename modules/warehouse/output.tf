output "warehouse_name" {
  description = "Name of the created Snowflake warehouse"
  value       = snowflake_warehouse.warehouse.name
}
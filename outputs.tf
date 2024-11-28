output "route_table_ID" {
  value       = aws_route_table.AppRouteTable.id
  description = "The ID of the route table"
}

output "instance1_id" {
  value       = aws_instance.WebServer1.id
  description = "The ID of the first EC2 instance"
}

output "instance2_id" {
  value       = aws_instance.WebServer2.id
  description = "The ID of the second EC2 instance"
}

output "rds_endpoint" {
  value       = aws_db_instance.app_database.endpoint
  description = "The endpoint of the RDS instance"
}

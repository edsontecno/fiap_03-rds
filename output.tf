output "rds_dominio_endpoint" {
  description = "Endpoint do banco de dados RDS PostgreSQL"
  value       = aws_db_instance.bd_dominio.endpoint
}

output "rds_dominio_port" {
  description = "Porta do banco de dados RDS PostgreSQL"
  value       = aws_db_instance.bd_dominio.port
}

output "rds__pedido_endpoint" {
  description = "Endpoint do banco de dados RDS PostgreSQL"
  value       = aws_db_instance.bd_pedido.endpoint
}

output "rds_pedido_port" {
  description = "Porta do banco de dados RDS PostgreSQL"
  value       = aws_db_instance.bd_pedido.port
}

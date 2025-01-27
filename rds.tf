resource "aws_db_instance" "bd_pedido" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "13"
  instance_class       = var.db_instance_class
  db_name              = "postgres"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true
  publicly_accessible  = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_db_instance" "bd_dominio" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "13"
  instance_class       = var.db_instance_class
  db_name              = "postgres"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true
  publicly_accessible  = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}

# DynamoDB Table
resource "aws_dynamodb_table" "dynamo_db" {
  name           = "payment"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"         # Definindo "id" como chave primária (hash key)
  attribute {
    name = "id"
    type = "S" # Tipo String
  }
  tags = {
    Name = "payment"
  }
}

# # Cluster DocumentDB
# resource "aws_docdb_cluster" "docdb_cluster" {
#   cluster_identifier = "docdb-cluster"
#   engine             = "docdb"
#   master_username    = var.master_username
#   master_password    = var.master_password
#   backup_retention_period = 7
#   preferred_backup_window = "07:00-09:00"

#   db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]

#   tags = {
#     Name = "DocumentDB Cluster"
#   }
# }

# # Instância do Cluster DocumentDB
# resource "aws_docdb_cluster_instance" "docdb_instance" {
#   count               = 1
#   identifier          = "docdb-instance"
#   cluster_identifier  = aws_docdb_cluster.docdb_cluster.id
#   instance_class      = "t3.medium"
#   apply_immediately   = true

#   tags = {
#     Name = "DocumentDB Instance mongo"
#   }
# }


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "RDS subnet group"
  }
}

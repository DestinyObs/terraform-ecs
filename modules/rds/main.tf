resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.environment}-rds-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "rds" {
  identifier          = "${var.environment}-rds-instance"
  allocated_storage   = var.allocated_storage
  instance_class      = var.db_instance_class
  engine              = "postgres"
  engine_version      = "17.5"
  username            = var.db_username
  password            = var.db_password
  port                = var.db_port
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  multi_az            = var.multi_az
  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name        = "${var.environment}-rds-instance"
    Environment = var.environment
  }
}

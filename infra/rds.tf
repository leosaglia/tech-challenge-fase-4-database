resource "aws_security_group" "rds_sg" {
  name        = "tech-challenge-rds-sg"
  description = "Security group for RDS PostgreSQL from the TechChallenge APP"
  vpc_id      = data.aws_vpc.selected_vpc.id

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "techchallenge_rds_subnet_group"
  subnet_ids = [for id in data.aws_subnets.private_subnets.ids : id]
}

resource "aws_db_instance" "order_db_postgres" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  identifier             = "order-db"
  db_name                = local.order_db_credentials["db_name"]
  username               = local.order_db_credentials["username"]
  password               = local.order_db_credentials["password"]
  parameter_group_name   = "default.postgres13"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = true

  depends_on = [
    aws_security_group.rds_sg,
    aws_db_subnet_group.rds_subnet_group,
    aws_secretsmanager_secret_version.order_db_credentials_secret_version
  ]
}

resource "aws_db_instance" "payment_db_postgres" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  identifier             = "payment-db"
  db_name                = local.payment_db_credentials["db_name"]
  username               = local.payment_db_credentials["username"]
  password               = local.payment_db_credentials["password"]
  parameter_group_name   = "default.postgres13"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = true

  depends_on = [
    aws_security_group.rds_sg,
    aws_db_subnet_group.rds_subnet_group,
    aws_secretsmanager_secret_version.payment_db_credentials_secret_version
  ]
}

resource "aws_db_instance" "customer_db_postgres" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  identifier             = "customer-db"
  db_name                = local.customer_db_credentials["db_name"]
  username               = local.customer_db_credentials["username"]
  password               = local.customer_db_credentials["password"]
  parameter_group_name   = "default.postgres13"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  skip_final_snapshot = true

  depends_on = [
    aws_security_group.rds_sg,
    aws_db_subnet_group.rds_subnet_group,
    aws_secretsmanager_secret_version.customer_db_credentials_secret_version
  ]
}
resource "aws_secretsmanager_secret" "order_db_credentials_secret" {
  name        = "tech-challenge-order-db-credentials"
  description = "Database credentials for Order db PostgreSQL RDS Instance"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "order_db_credentials_secret_version" {
  secret_id     = aws_secretsmanager_secret.order_db_credentials_secret.id
  secret_string = jsonencode(var.order_db_credentials)

  depends_on = [aws_secretsmanager_secret.order_db_credentials_secret]
}

data "aws_secretsmanager_secret_version" "order_db_credentials_secret_version" {
  secret_id = aws_secretsmanager_secret.order_db_credentials_secret.id

  depends_on = [aws_secretsmanager_secret_version.order_db_credentials_secret_version]
}

resource "aws_secretsmanager_secret" "payment_db_credentials_secret" {
  name        = "tech-challenge-payment-db-credentials"
  description = "Database credentials for Payment db PostgreSQL RDS Instance"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "payment_db_credentials_secret_version" {
  secret_id     = aws_secretsmanager_secret.payment_db_credentials_secret.id
  secret_string = jsonencode(var.payment_db_credentials)

  depends_on = [aws_secretsmanager_secret.payment_db_credentials_secret]
}

data "aws_secretsmanager_secret_version" "payment_db_credentials_secret_version" {
  secret_id = aws_secretsmanager_secret.payment_db_credentials_secret.id

  depends_on = [aws_secretsmanager_secret_version.payment_db_credentials_secret_version]
}

resource "aws_secretsmanager_secret" "customer_db_credentials_secret" {
  name        = "tech-challenge-customer-db-credentials"
  description = "Database credentials for customer db PostgreSQL RDS Instance"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "customer_db_credentials_secret_version" {
  secret_id     = aws_secretsmanager_secret.customer_db_credentials_secret.id
  secret_string = jsonencode(var.customer_db_credentials)

  depends_on = [aws_secretsmanager_secret.customer_db_credentials_secret]
}

data "aws_secretsmanager_secret_version" "customer_db_credentials_secret_version" {
  secret_id = aws_secretsmanager_secret.customer_db_credentials_secret.id

  depends_on = [aws_secretsmanager_secret_version.customer_db_credentials_secret_version]
}
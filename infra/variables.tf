variable "order_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "postgres"
    db_name  = "order"
  }
}

variable "payment_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "postgres"
    db_name  = "payment"
  }
}

variable "customer_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "postgres"
    db_name  = "customer"
  }
}
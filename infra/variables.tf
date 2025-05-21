variable "order_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "postgres"
    db_name  = "DBTCorder"
  }
}

variable "payment_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "postgres"
    db_name  = "DBTCpayment"
  }
}

variable "customer_db_credentials" {
  type = map(string)
  default = {
    username = "postgres"
    password = "postgres"
    db_name  = "DBTCcustomer"
  }
}
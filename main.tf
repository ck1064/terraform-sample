terraform {
  required_version = ">= 1.1.7"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.32.0"
    }
  }
}

provider "snowflake" {
  alias            = "sys_admin"
  role             = "SYSADMIN"
  region           = "AWS_CA_CENTRAL_1"
  account          = "KJ91939"
  private_key_path = "../monitor/snow-env/keys/rsa_key.p8"
  username         = "chen"
}

resource "snowflake_database" "db" {
  provider = snowflake.sys_admin
  name     = "MY_TEST_2"
}

resource "snowflake_warehouse" "warehouse" {
  provider       = snowflake.sys_admin
  name           = "DEV_ETL_WH_CH_2"
  warehouse_size = "small"
  auto_suspend   = 60
}

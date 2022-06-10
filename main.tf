terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.22.0"
    }
  }
}

provider "snowflake" {
  alias = "sys_admin"
  role  = "SYSADMIN"
}

resource "snowflake_database" "db" {
  provider = snowflake.sys_admin
  name     = "MY_TEST_2"
}

resource "snowflake_warehouse" "warehouse" {
  provider       = snowflake.sys_admin
  name           = "DEV_ETL_WH_CH_2"
  warehouse_size = "small"

  auto_suspend = 10
}

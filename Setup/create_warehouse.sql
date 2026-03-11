CREATE WAREHOUSE CARWASH_WH
  WITH WAREHOUSE_SIZE = 'X-SMALL'
  AUTO_SUSPEND = 60        -- suspends after 60 seconds idle
  AUTO_RESUME = TRUE       -- auto-starts when a query runs
  INITIALLY_SUSPENDED = TRUE;

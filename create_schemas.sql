USE DATABASE CARWASH_RAW;
CREATE SCHEMA POS;         -- point-of-sale transactions
CREATE SCHEMA CRM;         -- member / loyalty data
CREATE SCHEMA LOCATIONS;   -- location master data

USE DATABASE CARWASH_ANALYTICS;
CREATE SCHEMA STAGING;     -- cleaned, typed source data
CREATE SCHEMA MARTS;       -- final analytics models
CREATE SCHEMA REPORTING;   -- views for dashboards

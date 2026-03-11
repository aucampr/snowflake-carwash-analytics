-- Raw landing zone — data arrives here untouched
CREATE DATABASE CARWASH_RAW;

-- Clean analytics layer — transformed, tested data

CREATE DATABASE CARWASH_ANALYTICS;

-- Verify
SHOW DATABASES LIKE 'CARWASH%';

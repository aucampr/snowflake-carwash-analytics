-- Step 1: Create an internal stage (a file staging area in Snowflake)
CREATE STAGE CARWASH_RAW.CRM.MEMBER_STAGE
  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1);

-- Step 2: Upload your members.csv using SnowSQL CLI or Snowsight upload
-- PUT file:///path/to/members.csv @CARWASH_RAW.CRM.MEMBER_STAGE;CARWASH_RAW.CRM.MEMBER_STAGE

-- Step 3: Preview the staged file
SELECT $1, $2, $3, $4 FROM @CARWASH_RAW.CRM.MEMBER_STAGE LIMIT 5;

-- Step 4: Load into the table
COPY INTO CARWASH_RAW.CRM.MEMBERS
  FROM @CARWASH_RAW.CRM.MEMBER_STAGE
  FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1)
  ON_ERROR = 'CONTINUE';   -- log errors, don't fail the whole load

-- Step 5: Check load history
SELECT * FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(
  TABLE_NAME => 'MEMBERS', START_TIME => DATEADD('hour', -1, CURRENT_TIMESTAMP())
));


-- Step 1: Create the stage
CREATE STAGE CARWASH_RAW.POS.VISITS_STAGE
  FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
  );

-- Step 2: Upload visits.csv to the stage via Snowsight UI
-- (Data → Databases → CARWASH_RAW → POS → Stages → VISITS_STAGE → + Files)

-- Step 3: Preview the staged file
SELECT $1, $2, $3, $4, $5, $6, $7
FROM @CARWASH_RAW.POS.VISITS_STAGE
LIMIT 5;

-- Step 4: Load into the table
COPY INTO CARWASH_RAW.POS.VISITS
  FROM @CARWASH_RAW.POS.VISITS_STAGE
  FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
  )
  ON_ERROR = 'CONTINUE';

-- Step 5: Verify
SELECT COUNT(*) AS total_visits FROM CARWASH_RAW.POS.VISITS;

-- Step 1: Create the stage
CREATE STAGE CARWASH_RAW.POS.TRANSACTIONS_STAGE
  FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
  );

-- Step 2: Upload transactions.csv to the stage via Snowsight UI
-- (Data → Databases → CARWASH_RAW → POS → Stages → TRANSACTIONS_STAGE → + Files)

-- Step 3: Preview the staged file
SELECT $1, $2, $3, $4, $5, $6, $7, $8
FROM @CARWASH_RAW.POS.TRANSACTIONS_STAGE
LIMIT 5;

-- Step 4: Load into the table
COPY INTO CARWASH_RAW.POS.TRANSACTIONS
  FROM @CARWASH_RAW.POS.TRANSACTIONS_STAGE
  FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    SKIP_HEADER = 1
  )
  ON_ERROR = 'CONTINUE';

-- Step 5: Verify
SELECT COUNT(*) AS total_transactions FROM CARWASH_RAW.POS.TRANSACTIONS;
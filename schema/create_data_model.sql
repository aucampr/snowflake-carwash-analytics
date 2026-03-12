-- LOCATIONS dimension
CREATE TABLE CARWASH_RAW.LOCATIONS.LOCATIONS (
    location_id     VARCHAR(20)     NOT NULL,
    location_name   VARCHAR(100),
    city            VARCHAR(60),
    state           VARCHAR(2),
    opened_date     DATE,
    is_active       BOOLEAN         DEFAULT TRUE,
    _loaded_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);

-- MEMBERSHIP PLANS dimension
CREATE TABLE CARWASH_RAW.CRM.MEMBERSHIP_PLANS (
    plan_code       VARCHAR(20)     NOT NULL,
    plan_name       VARCHAR(100),
    monthly_price   NUMBER(8,2),
    wash_tier       VARCHAR(20),     -- BASIC | DELUXE | ULTIMATE
    is_active       BOOLEAN         DEFAULT TRUE,
    _loaded_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);

-- MEMBERS dimension
CREATE TABLE CARWASH_RAW.CRM.MEMBERS (
    member_id       VARCHAR(36)     NOT NULL,   -- UUID
    email           VARCHAR(200),
    first_name      VARCHAR(60),
    last_name       VARCHAR(60),
    phone           VARCHAR(20),
    plan_code       VARCHAR(20),
    enrolled_date   DATE,
    status          VARCHAR(20),    -- ACTIVE | PAUSED | CANCELLED
    _loaded_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);

-- VISITS fact table
CREATE TABLE CARWASH_RAW.POS.VISITS (
    visit_id        VARCHAR(36)     NOT NULL,
    member_id       VARCHAR(36),
    location_id     VARCHAR(20),
    visited_at      TIMESTAMP_NTZ,
    wash_type       VARCHAR(20),
    channel         VARCHAR(20),    -- APP | LICENSE_PLATE | RFID | WALK_UP
    _loaded_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);

-- TRANSACTIONS fact table
CREATE TABLE CARWASH_RAW.POS.TRANSACTIONS (
    transaction_id  VARCHAR(36)     NOT NULL,
    member_id       VARCHAR(36),
    location_id     VARCHAR(20),
    transacted_at   TIMESTAMP_NTZ,
    amount          NUMBER(10,2),
    transaction_type VARCHAR(30),   -- SIGNUP | RENEWAL | UPGRADE | CHARGEBACK
    plan_code       VARCHAR(20),
    _loaded_at      TIMESTAMP_NTZ   DEFAULT CURRENT_TIMESTAMP()
);


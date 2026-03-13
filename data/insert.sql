-- Insert sample locations
INSERT INTO CARWASH_RAW.LOCATIONS.LOCATIONS VALUES
  ('LOC001', 'Indianapolis North', 'Indianapolis', 'IN', '2019-03-15', TRUE, CURRENT_TIMESTAMP()),
  ('LOC002', 'Indianapolis South', 'Indianapolis', 'IN', '2020-07-01', TRUE, CURRENT_TIMESTAMP()),
  ('LOC003', 'Columbus East',      'Columbus',     'OH', '2021-02-20', TRUE, CURRENT_TIMESTAMP()),
  ('LOC004', 'Minneapolis West',   'Minneapolis',  'MN', '2022-05-10', TRUE, CURRENT_TIMESTAMP()),
  ('LOC005', 'Chicago Loop',       'Chicago',      'IL', '2023-01-08', TRUE, CURRENT_TIMESTAMP());

-- Insert membership plans
INSERT INTO CARWASH_RAW.CRM.MEMBERSHIP_PLANS VALUES
  ('BASIC',    'Basic Wash',    14.99, 'BASIC',   TRUE, CURRENT_TIMESTAMP()),
  ('DELUXE',   'Deluxe Wash',   24.99, 'DELUXE',  TRUE, CURRENT_TIMESTAMP()),
  ('ULTIMATE', 'Ultimate Wash', 34.99, 'ULTIMATE',TRUE, CURRENT_TIMESTAMP());

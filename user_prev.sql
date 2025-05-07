-- SELECT * FROM information_schema.role_table_grants WHERE grantee = 'postgres';

-- GRANT CONNECT ON DATABASE ccdb TO postgres;
-- GRANT USAGE ON SCHEMA public TO postgres;

-- GRANT SELECT ON ALL TABLES IN SCHEMA public TO postgres;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO postgres;

-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO postgres;
-- commit;

-- select * from cc_detail;
-- SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- commit;

COPY cc_detail
FROM 'D:\power_bi_dataset\credit_card_dashboard\credit_card_processed.csv' 
DELIMITER ',' 
CSV HEADER;

-- commit;

COPY cust_detail
FROM 'D:\power_bi_dataset\credit_card_dashboard\customer.csv' 
DELIMITER ',' 
CSV HEADER;
-- commit;

ALTER TABLE cc_detail SET LOGGED;
ALTER TABLE cust_detail SET LOGGED;

COPY cc_detail
FROM 'D:\power_bi_dataset\credit_card_dashboard\cc_add_processed.csv' 
DELIMITER ',' 
CSV HEADER;
commit;

COPY cust_detail
FROM 'D:\power_bi_dataset\credit_card_dashboard\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;

commit;


SELECT S_SUPPKEY AS SUPPLIER_KEY
    , S_NAME AS SUPPLIER_NAME
    , S_ADDRESS AS SUPPLIER_ADDRESS
    , S_PHONE AS SUPPLIER_PHONE_NUMBER
    , S_ACCTBAL AS SUPPLIER_ACCOUNT_BALANCE
    , S_COMMENT AS SUPPLIER_COMMENT
    , N.N_NAME AS SUPPLIER_NATION
    , R.R_NAME AS SUPPLIER_REGION
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."SUPPLIER" S
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."NATION" N ON S.S_NATIONKEY = N.N_NATIONKEY
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."REGION" R ON N.N_REGIONKEY = R.R_REGIONKEY
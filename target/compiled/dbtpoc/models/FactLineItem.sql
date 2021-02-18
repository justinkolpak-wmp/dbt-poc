

SELECT L_ORDERKEY AS ORDER_KEY
    , L_LINENUMBER AS LINE_NUMBER
    , CONCAT(L_ORDERKEY, L_LINENUMBER) AS LINE_ORDER_KEY
    , L_QUANTITY AS QUANTITY
    , L_EXTENDEDPRICE AS EXTENDED_PRICE
    , L_DISCOUNT AS LINE_DISCOUNT
    , L_TAX AS LINE_TAX
    , CASE L_RETURNFLAG
        WHEN 'R' THEN 'Returned'
        WHEN 'A' THEN 'Available for Return'
        WHEN 'N' THEN 'Not Available for Return'
      END AS LINE_RETURN_FLAG  
    , L_SHIPDATE AS LINE_SHIP_DATE
    , L_RECEIPTDATE AS LINE_RECEIPT_DATE
    , L_COMMITDATE AS LINE_COMMITDATE
    , L_RECEIPTDATE - L_SHIPDATE AS SHIP_RECEIPT_LAG
    , L_PARTKEY AS LINE_PART_KEY
    , L_SUPPKEY AS LINE_SUPPLIER_KEY 
FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."LINEITEM" L
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."PART" P ON L.L_PARTKEY = P.P_PARTKEY
LEFT JOIN DBT_POC.dbt_jkolpak.DimSupplier S ON L.L_SUPPKEY = S.SUPPLIER_KEY
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."ORDERS" O ON L.L_ORDERKEY = O.O_ORDERKEY
LEFT JOIN "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF10"."CUSTOMER" C ON O.O_CUSTKEY = C.C_CUSTKEY



  -- this filter will only be applied on an incremental run
WHERE L_RECEIPTDATE > (select max(LINE_RECEIPT_DATE ) from DBT_POC.dbt_jkolpak.FactLineItem)


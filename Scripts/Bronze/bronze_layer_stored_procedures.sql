CREATE OR REPLACE PROCEDURE bronze.load_bronze ()
LANGUAGE plpgsql AS
$$

DECLARE
    v_rows        BIGINT;
    v_start       TIMESTAMP;
    v_batch_start TIMESTAMP := clock_timestamp();
	
BEGIN

    RAISE NOTICE 'Start stored procedure';

    ------------------------------------------------------------
    -- customers  (file is Windows-1252, not UTF-8)
    ------------------------------------------------------------
	
    RAISE NOTICE 'Start importing data from customers';
	
    v_start := clock_timestamp();

    TRUNCATE TABLE bronze.customers;
    COPY bronze.customers
    FROM '/run/media/mahmoud-atef/Data/Projects/electronics-retail-data-warehouse/Datasets/Customers.csv'
    WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'WIN1252');

    GET DIAGNOSTICS v_rows = ROW_COUNT;
	
    RAISE NOTICE 'Finish importing customers: % rows in % sec',
	
        v_rows, round(EXTRACT(EPOCH FROM clock_timestamp() - v_start)::NUMERIC, 2);

    ------------------------------------------------------------
    -- exchange_rates
    ------------------------------------------------------------
	
    RAISE NOTICE 'Start importing data from exchange_rates';
	
    v_start := clock_timestamp();

    TRUNCATE TABLE bronze.exchange_rates;
    COPY bronze.exchange_rates
    FROM '/run/media/mahmoud-atef/Data/Projects/electronics-retail-data-warehouse/Datasets/Exchange_Rates.csv'
    WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8');

    GET DIAGNOSTICS v_rows = ROW_COUNT;
	
    RAISE NOTICE 'Finish importing exchange_rates: % rows in % sec',
	
        v_rows, round(EXTRACT(EPOCH FROM clock_timestamp() - v_start)::NUMERIC, 2);

    ------------------------------------------------------------
    -- products
    ------------------------------------------------------------
	
    RAISE NOTICE 'Start importing data from products';
	
    v_start := clock_timestamp();

    TRUNCATE TABLE bronze.products;
    COPY bronze.products
    FROM '/run/media/mahmoud-atef/Data/Projects/electronics-retail-data-warehouse/Datasets/Products.csv'
    WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8');

    GET DIAGNOSTICS v_rows = ROW_COUNT;
	
    RAISE NOTICE 'Finish importing products: % rows in % sec',
	
        v_rows, round(EXTRACT(EPOCH FROM clock_timestamp() - v_start)::NUMERIC, 2);

    ------------------------------------------------------------
    -- sales
    ------------------------------------------------------------
	
    RAISE NOTICE 'Start importing data from sales';
	
    v_start := clock_timestamp();

    TRUNCATE TABLE bronze.sales;
    COPY bronze.sales
    FROM '/run/media/mahmoud-atef/Data/Projects/electronics-retail-data-warehouse/Datasets/Sales.csv'
    WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8');

    GET DIAGNOSTICS v_rows = ROW_COUNT;
	
    RAISE NOTICE 'Finish importing sales: % rows in % sec',
	
        v_rows, round(EXTRACT(EPOCH FROM clock_timestamp() - v_start)::NUMERIC, 2);

    ------------------------------------------------------------
    -- stores
    ------------------------------------------------------------
	
    RAISE NOTICE 'Start importing data from stores';
	
    v_start := clock_timestamp();

    TRUNCATE TABLE bronze.stores;
    COPY bronze.stores
    FROM '/run/media/mahmoud-atef/Data/Projects/electronics-retail-data-warehouse/Datasets/Stores.csv'
    WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8');

    GET DIAGNOSTICS v_rows = ROW_COUNT;
	
    RAISE NOTICE 'Finish importing stores: % rows in % sec',
	
        v_rows, round(EXTRACT(EPOCH FROM clock_timestamp() - v_start)::NUMERIC, 2);

    RAISE NOTICE 'End stored procedure (total % sec)',
	
        round(EXTRACT(EPOCH FROM clock_timestamp() - v_batch_start)::NUMERIC, 2);

END;
$$;

-- Run it:
-- CALL bronze.load_bronze();

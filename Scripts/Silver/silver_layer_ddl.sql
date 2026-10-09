DROP TABLE IF EXISTS silver.customers ;

CREATE TABLE silver.customers (

    customer_key    INTEGER PRIMARY KEY,
    gender          VARCHAR(10),
    name            VARCHAR(100),
    city            VARCHAR(100),
    state_code      VARCHAR(50),
    state           VARCHAR(100),
    zip_code        VARCHAR(20),
    country         VARCHAR(50),
    continent       VARCHAR(50),
    birthday        DATE,
    dwh_load_date   TIMESTAMP DEFAULT now()
	
) ;

DROP TABLE IF EXISTS silver.exchange_rates ;

CREATE TABLE silver.exchange_rates (

    rate_date       DATE,
    currency        VARCHAR(3),
    exchange_rate   NUMERIC(10,4),
    dwh_load_date   TIMESTAMP DEFAULT now(),
    PRIMARY KEY (rate_date, currency)
	
) ;

DROP TABLE IF EXISTS silver.products ;

CREATE TABLE silver.products (

    product_key     INTEGER PRIMARY KEY,
    product_name    VARCHAR(255),
    brand           VARCHAR(50),
    color           VARCHAR(50),
    unit_cost_usd   NUMERIC(10,2),
    unit_price_usd  NUMERIC(10,2),
    subcategory_key VARCHAR(4),
    subcategory     VARCHAR(100),
    category_key    VARCHAR(2),
    category        VARCHAR(100),
    dwh_load_date   TIMESTAMP DEFAULT now() 
	
) ;

DROP TABLE IF EXISTS silver.sales ;

CREATE TABLE silver.sales (

    order_number    INTEGER,
    line_item       INTEGER,
    order_date      DATE,
    delivery_date   DATE,
    customer_key    INTEGER,
    store_key       INTEGER,
    product_key     INTEGER,
    quantity        INTEGER,
    currency_code   VARCHAR(3),
    dwh_load_date   TIMESTAMP DEFAULT now(),
    PRIMARY KEY (order_number, line_item) 
	
) ;

DROP TABLE IF EXISTS silver.stores ;

CREATE TABLE silver.stores (

    store_key       INTEGER PRIMARY KEY,
    country         VARCHAR(50),
    state           VARCHAR(100),
    square_meters   INTEGER,
    open_date       DATE,
    dwh_load_date   TIMESTAMP DEFAULT now()
	
) ;

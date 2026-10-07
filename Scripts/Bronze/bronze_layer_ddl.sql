DROP TABLE IF EXISTS bronze.customers ;

CREATE TABLE bronze.customers (

	customer_key		TEXT ,
	gender				TEXT ,
	name				TEXT ,
	city				TEXT ,
	state_code 			TEXT ,
	state				TEXT , 
	zip_code			TEXT , 
	country				TEXT ,
	continent			TEXT ,
	birthday			TEXT 
	
) ; 

DROP TABLE IF EXISTS bronze.exchange_rates ; 

CREATE TABLE bronze.exchange_rates (

	date				TEXT ,
	currency 			TEXT , 
	exchange			TEXT
	
) ; 

DROP TABLE IF EXISTS bronze.products ;

CREATE TABLE bronze.products (

	product_key			TEXT ,
	product_name		TEXT ,
	brand				TEXT ,
	color				TEXT , 
	unit_cost_usd		TEXT , 
	unit_price_usd		TEXT ,
	subcategory_key		TEXT , 
	subcategory			TEXT , 
	category_key 		TEXT ,
	category			TEXT

) ;

DROP TABLE IF EXISTS bronze.sales ; 

CREATE TABLE bronze.sales (

	order_number		TEXT ,
	line_item			TEXT ,
	order_date			TEXT ,
	delivery_date		TEXT ,
	customer_key		TEXT ,
	store_key			TEXT , 
	product_key 		TEXT ,
	quantity			TEXT ,
	currency_code		TEXT 

) ; 

DROP TABLE IF EXISTS bronze.stores ; 

CREATE TABLE bronze.stores (

	store_key			TEXT ,
	country 			TEXT ,
	state				TEXT , 	
	square_meters		TEXT ,
	open_date			TEXT 

) ; 

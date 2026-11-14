/*
    Business Insights 360 - AtliQ Hardware
    Base query behind net sales.

    Brings sales, customer, product and gross price together and attaches the
    pre invoice discount percentage for that customer and fiscal year.
    This is the query the net_sales view is built on.
*/

SELECT 
s.date,
s.fiscal_year,
s.customer_code,
c.market,s.product_code,p.product, p.variant ,s.sold_quantity,
g.gross_price as gross_price_per_item,round(s.sold_quantity*gross_price,2) as total_gross_Price,
pre_invoice_discount_pct

FROM fact_sales_monthly s 
join dim_customer c
	using(customer_code)
join dim_product p
	using(product_code)
join fact_gross_price g
	on g.product_code = s.product_code and g.fiscal_year =  s.fiscal_year
join fact_pre_invoice_deductions pre
	on pre.customer_code = s.customer_code and pre.fiscal_year = s.fiscal_year
    
-- where s.fiscal_year =2021	
;

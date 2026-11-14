/*
    Business Insights 360 - AtliQ Hardware
    Gross sales queries.

    Customer code 90002002 is Croma India, used here as the sample customer.
    get_fiscal_year() is a user defined function - AtliQ's fiscal year runs Sep to Aug.
*/

-- ----------------------------------------------------------------------------------------------
-- Croma India - product level sales for FY 2021
-- ----------------------------------------------------------------------------------------------
SELECT s.date,s.product_code,p.product, p.variant ,s.sold_quantity,
gross_price,round(s.sold_quantity*gross_price,2) as total_gross_Price

FROM fact_sales_monthly s join dim_product p
using(product_code) join fact_gross_price g
on g.product_code = s.product_code and g.fiscal_year = get_fiscal_year(s.date)

where customer_code = 90002002 and get_fiscal_year(date)=2021
order by date asc
limit 100000;

-- ----------------------------------------------------------------------------------------------
-- Croma India - gross sales by month
-- ----------------------------------------------------------------------------------------------
select s.date,sum(s.sold_quantity*gross_price) as Gross_sales
from fact_sales_monthly s join fact_gross_price g
on s.product_code=g.product_code and g.fiscal_year = get_fiscal_year(s.date)
where customer_code = 90002002
group by s.date
order by date asc;

-- ----------------------------------------------------------------------------------------------
-- Croma India - gross sales by fiscal year
-- ----------------------------------------------------------------------------------------------
select g.fiscal_year,
round(sum(s.sold_quantity*gross_price),2) as yearly_sales
from fact_sales_monthly s join fact_gross_price g
on s.product_code=g.product_code and g.fiscal_year = get_fiscal_year(s.date)
where customer_code = 90002002
group by g.fiscal_year
order by g.fiscal_year;

-- ----------------------------------------------------------------------------------------------
-- India - total quantity sold in FY 2021 (used for the market badge)
-- ----------------------------------------------------------------------------------------------
select sum(sold_quantity) as total_qty from fact_sales_monthly s
join dim_customer c using(customer_code)
where market = 'india' and get_fiscal_year(s.date) = 2021
group by market;

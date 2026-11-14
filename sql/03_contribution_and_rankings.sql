/*
    Business Insights 360 - AtliQ Hardware
    Net sales contribution and ranking queries for FY 2021.

    Uses the net_sales and gross_sales views.
*/

-- ----------------------------------------------------------------------------------------------
-- Top 5 markets by net sales
-- ----------------------------------------------------------------------------------------------
select market, round(sum(net_sales)/1000000,2) as net_sales_mln
from net_Sales where fiscal_year = 2021
group by market
order by net_sales_mln desc
limit 5;

-- ----------------------------------------------------------------------------------------------
-- Top 5 customers by net sales
-- ----------------------------------------------------------------------------------------------
select c.customer, round(sum(net_sales)/1000000,2) as net_sales_mln
from net_Sales join dim_customer c using(customer_code)
where fiscal_year = 2021
group by c.customer
order by net_sales_mln desc
limit 5;

-- ----------------------------------------------------------------------------------------------
-- Customer wise net sales percentage contribution
-- ----------------------------------------------------------------------------------------------
with cte1
as (select customer, round(sum(net_sales)/1000000,2) as net_sales_mln
from net_Sales s join dim_customer c using(customer_code)
where s.fiscal_year = 2021
group by customer)

select *, net_sales_mln*100/sum(net_sales_mln) over() as pct from cte1
order by net_sales_mln desc ;

-- ----------------------------------------------------------------------------------------------
-- Customer share within each region
-- ----------------------------------------------------------------------------------------------
with cte2 as(
select customer,region, round(sum(net_sales)/1000000,2) as net_sales_mln
from net_Sales s join dim_customer c using(customer_code)
where s.fiscal_year = 2021
group by customer,region)

select *, net_sales_mln*100/sum(net_sales_mln) over(partition by region) as pct_share_region from cte2
order by region ,pct_share_region desc ;

-- ----------------------------------------------------------------------------------------------
-- Top 3 products in each division by quantity sold
-- ----------------------------------------------------------------------------------------------
with cte1 as(
select division,product,sum(sold_quantity) as total_qty
from fact_sales_monthly join dim_product using(product_code)
where fiscal_year = 2021
group by division,product),
cte2 as (
select *, dense_rank() over(partition by division order by total_qty desc) as drnk from cte1
)
select * from cte2
where drnk <=3;

-- ----------------------------------------------------------------------------------------------
-- Top 2 markets in each region by gross sales
-- ----------------------------------------------------------------------------------------------
with cte1 as(
select c.market,region,round(sum(gross_price_total)/1000000,2)  as gross_sales_mln from dim_customer c
join gross_sales gs using(customer_code)
where fiscal_year = 2021
group by c.market,region),
cte2 as (select *,rank() over(partition by region order by gross_sales_mln desc) as rnk from cte1)
select * from cte2
where rnk<=2;

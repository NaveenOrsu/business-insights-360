/*
    Business Insights 360 - AtliQ Hardware
    Supply chain helper table.

    fact_act_est puts actual sold quantity and forecast quantity side by side
    for every date, customer and product. A full outer join is needed because a
    product can be forecast but not sold, or sold but not forecast - MySQL has no
    FULL OUTER JOIN, so two LEFT JOINs are combined with UNION.

    Missing quantities are set to 0 so forecast accuracy and net error can be
    calculated without NULL gaps.
*/

drop table if exists fact_act_est;

create table fact_act_est
(
        select 
            s.date as date,
            s.fiscal_year as fiscal_year,
            s.product_code as product_code,
            s.customer_code as customer_code,
            s.sold_quantity as sold_quantity,
            f.forecast_quantity as forecast_quantity
        from 
            fact_sales_monthly s
        left join fact_forecast_monthly f 
        using (date, customer_code, product_code)
)
union
(
        select 
            f.date as date,
            f.fiscal_year as fiscal_year,
            f.product_code as product_code,
            f.customer_code as customer_code,
            s.sold_quantity as sold_quantity,
            f.forecast_quantity as forecast_quantity
        from 
            fact_forecast_monthly  f
        left join fact_sales_monthly s 
        using (date, customer_code, product_code)
);

update fact_act_est
set sold_quantity = 0
where sold_quantity is null;

update fact_act_est
set forecast_quantity = 0
where forecast_quantity is null;

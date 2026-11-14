# Business Insights 360

**Tools:** Power BI · DAX · Power Query · MySQL · Excel

**Source:** Codebasics guided project — AtliQ Hardware (1M+ rows)

**[View the live dashboard](https://app.powerbi.com/view?r=eyJrIjoiYzBkZTllOTYtYzJkNS00NWUwLWFhODktY2NiMWNjYWY5MjM1IiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9&pageName=ReportSection5d5977dcec69101a4cd2)** · **[Portfolio](https://codebasics.io/portfolio/NAVEEN-ORSU)** · **[LinkedIn](https://www.linkedin.com/in/naveenorsu/)**

---

## Problem

Give Finance, Sales, Marketing and Supply Chain teams one reporting layer to track performance against last year and against target.

## SQL in this repository

The SQL behind the report: how gross sales become net sales, how contribution and
rankings are worked out, and the helper table the supply chain page runs on.

| File | What it does |
| --- | --- |
| [`sql/01_gross_sales_queries.sql`](sql/01_gross_sales_queries.sql) | Gross sales by product, month and fiscal year for a single customer |
| [`sql/02_net_sales_base_query.sql`](sql/02_net_sales_base_query.sql) | Joins sales, product, gross price and pre-invoice discounts |
| [`sql/03_contribution_and_rankings.sql`](sql/03_contribution_and_rankings.sql) | Top markets and customers, % contribution, top products per division |
| [`sql/04_forecast_helper_table.sql`](sql/04_forecast_helper_table.sql) | `fact_act_est` — actual vs forecast quantity in one table |

Written in MySQL. Uses CTEs, window functions (`RANK`, `DENSE_RANK`, `SUM OVER`),
a user-defined fiscal-year function, and a UNION of two LEFT JOINs to work around
MySQL having no FULL OUTER JOIN.

## Data model

- **15 tables** — 8 fact, 7 dimension
- **Fiscal-year calendar (Sep–Aug)** with fiscal quarters and YTD / YTG flags
- Source data from **MySQL** and **Excel**, transformed in **Power Query**

## Report pages

| Page | What it answers |
| --- | --- |
| Finance | P&L performance vs last year and vs target |
| Sales | Customer and product performance, net sales breakdown |
| Marketing | Gross margin and net profit by product and region |
| Supply Chain | Forecast accuracy and net error by customer and product |
| Executive | Top-level KPIs for leadership review |

## What I built

- **P&L statement in DAX** — Gross Sales → Net Sales → Gross Margin → Net Profit, with a switch to compare against last year or target
- Fiscal-year and quarter button slicers, YTD / YTG toggles, bookmarks, page navigation and conditional formatting
- **Forecast accuracy** and net error measures to flag excess-inventory and out-of-stock risk
- Published to **Power BI Service**

## Key findings

- **FY2022 (est.)** — net sales ₹3.74bn at a **38.1% gross margin**, but a **−14.0% net profit**, driven by operating expenses
- **APAC** contributed **51%** of net sales
- **Forecast accuracy 81.2%** — net error by customer and product highlights where stock planning is weakest

---

> Guided project from the Codebasics Power BI course. The data model, DAX measures and report design were built by me.

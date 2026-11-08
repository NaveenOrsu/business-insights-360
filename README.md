# Business Insights 360

**Tools:** Power BI · DAX · Power Query · MySQL · Excel

**Source:** Codebasics guided project — AtliQ Hardware (1M+ rows)

**[View the live dashboard](https://app.powerbi.com/view?r=eyJrIjoiYzBkZTllOTYtYzJkNS00NWUwLWFhODktY2NiMWNjYWY5MjM1IiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9&pageName=ReportSection5d5977dcec69101a4cd2)** · **[Portfolio](https://codebasics.io/portfolio/NAVEEN-ORSU)** · **[LinkedIn](https://www.linkedin.com/in/naveenorsu/)**

---

## Problem

Give Finance, Sales, Marketing and Supply Chain teams one reporting layer to track performance against last year and against target.

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

## Repository structure

```
powerbi/    business_insights_360.pbix
images/     dashboard screenshots
docs/       project summary (optional)
```

## Dashboard screenshots

<!-- Upload PNGs to images/ then uncomment:
![Finance View](images/01_finance.png)
![Sales View](images/02_sales.png)
![Marketing View](images/03_marketing.png)
![Supply Chain View](images/04_supply_chain.png)
![Executive View](images/05_executive.png)
-->

---

> Guided project from the Codebasics Power BI course. The data model, DAX measures and report design were built by me.

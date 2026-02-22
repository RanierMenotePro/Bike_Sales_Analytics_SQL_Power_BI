# 📊 Sales Analytics Project – SQL + Power BI

## 📌 1. Project Overview

This project integrates **SQL data modeling** and **Power BI visualization** to build an end-to-end Business Intelligence solution.

The objective is to transform transactional sales data into analytical insights through:

- Creation of SQL analytical views  
- Dimensional modeling (star schema)  
- DAX measures  
- Interactive dashboards  
- Business-oriented KPI analysis  

This repository documents the full analytical workflow.

---

## 🗂 2. Project Architecture

Relational Database (SQL)  
        ↓  
Analytical Views (vw_sales_base, vw_product_metrics)  
        ↓  
Power BI (Data Model + DAX + Dashboard)  

### Data Modeling Approach

- `vw_sales_base` → Fact table (transactional sales data)
- `vw_product_metrics` → Product dimension
- Relationship: **Many-to-One (Sales → Product)**
- Schema type: **Simplified Star Schema**

This structure ensures:

- Proper aggregation behavior  
- Correct filter propagation  
- Scalable analytical design  

---

## 🛠 3. Technologies Used

- SQL (data transformation & analytical views)
- Power BI Desktop
- DAX (Data Analysis Expressions)

---

## 📂 4. Repository Structure

```
/sql
    data (.csv files)
    ...
    create_views.sql
    analytical_queries.sql
    ...

/powerbi
    sales_dashboard.pbix

/images
    dashboard_overview.png
    product_analysis.png

README.md
```

---

## 📈 5. Analytical Scope (Current Phase)

So far, the project includes:

- Data modeling with correct cardinality
- Revenue aggregation correction (SUM vs COUNT issue)
- Revenue by product analysis
- Initial exploratory visualizations
- Relationship validation between fact and dimension tables

---

## 📊 6. Core Metrics (Implemented / In Progress)

### DAX Measures

```DAX
Total Revenue = SUM(vw_sales_base[net_revenue])

Total Orders = DISTINCTCOUNT(vw_sales_base[order_id])

Average Ticket = DIVIDE([Total Revenue], [Total Orders])
```

### Planned Metrics

- Revenue share by product
- Cumulative revenue (Pareto analysis)
- Monthly growth rate
- Category performance comparison

---

## 📅 7. Upcoming Development Phases

This project is actively evolving. Next planned improvements:

- Creation of a Date dimension table
- Monthly and yearly trend analysis
- Seasonality detection
- Top N product analysis
- Pareto (80/20) revenue distribution
- KPI summary dashboard
- Executive-level overview page
- Visual refinement and UX improvements

---

## 📊 8. Sample Dashboard

(Insert exported screenshots inside the images folder and reference them below.)

Example:

```
![Dashboard Overview](images/dashboard_overview.png)
```

```
![Product Analysis](images/product_analysis.png)
```

---

## 🧠 9. Business Questions Addressed

- Which products generate the highest revenue?
- Is revenue concentrated in a small group of products?
- What is the average order value?
- How does revenue evolve over time?

Additional analytical questions will be incorporated as the project expands.

---

## 🎯 10. Project Objective

This project demonstrates:

- Dimensional modeling principles
- Correct aggregation handling
- SQL-to-BI integration
- Analytical reasoning beyond visualization
- Structured BI workflow

It is designed as a portfolio project to showcase practical Business Intelligence skills and data modeling competence.

---

## 🚀 11. Future Enhancements

- Advanced DAX optimization
- Dynamic ranking measures
- Drill-through analysis
- Performance tuning
- Deployment to Power BI Service
- Public dashboard sharing

---

## 📌 Author

Developed as part of a Business Intelligence learning and portfolio development journey combining SQL engineering and Power BI analytics.

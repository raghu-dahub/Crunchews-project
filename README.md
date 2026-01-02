# Crunchews-project
Real-world data analytics project using live cashew business data. Analyzed sales, expenses, profit, and COGS using Excel, MySQL, and Power BI. Built an interactive dashboard with KPIs, trends, and insights to support data-driven business decisions.

# 🥜 CrunchEws – Cashew Sales & Profit Analytics

## 📌 Project Summary
**Crunchews** is a real-world data analytics project built using live transactional data from a cashew processing and trading business.  
The project focuses on analyzing **sales, expenses, cost of goods sold (COGS), profitability, quantity sold, and payment behavior** to generate actionable business insights.

This repository showcases an **end-to-end data analytics workflow**, covering data preparation, SQL-based analysis, and interactive dashboarding using **Power BI**.

---

## 🎯 Business Objectives
- Monitor **overall sales, expenses, and cost of goods**
- Analyze **profitability and profit margin**
- Track **monthly sales and profit trends**
- Identify **top-performing sellers**
- Understand **payment method distribution**
- Find **best-selling cashew types**
- Support **data-driven business decisions**

---

## 🗂️ Dataset Description
The project uses approximately **300 real transactional records**, structured into two main datasets:

### 📄 Sales & Expenses Data
- Date  
- Seller  
- Cashew Type (W320, W240, JH, Shell, etc.)  
- Quantity (in Kg)  
- Rate (per Kg)  
- Sale Amount  
- Payment Type (Cash, GPay, Mobile Banking, etc.)  
- Workers / Expense Category  
- Expenses  

### 📄 Cost (COGS) Data
- Date  
- Seller  
- Quantity (in Kg)  
- Amount  
- Cost of Goods Sold (COGS)  

---

## 🛠️ Tools & Technologies Used
- **Excel** – Data cleaning, transformation, and initial analysis  
- **MySQL** – Table creation, data storage, and analytical queries  
- **Power BI** – Data modeling, DAX calculations, and dashboard creation  
- **GitHub** – Version control and project documentation  

---

## 📊 Key KPIs Displayed
The dashboard highlights the following key metrics:

- **Total Sales:** ₹15.52M  
- **Total Expenses:** ₹1.8M  
- **Total Cost (COGS):** ₹12.21M  
- **Total Quantity Sold:** 80.80K Kg  
- **Profit Margin:** 88.42%  

---

## 📈 Dashboard Visuals & Insights
The Power BI dashboard includes:

### 🔹 KPI Cards
- Total Sales  
- Total Expenses  
- Total Cost (COGS)  
- Total Quantity Sold  
- Profit Margin (%)  

### 🔹 Trend Analysis
- **Monthly Sales & Profit Trend** (Line Chart)  
  - Identifies seasonal patterns and growth periods  

### 🔹 Comparative Analysis
- **COGS vs Sale Amounts** (Clustered Column Chart)  
  - Compares cost efficiency over time  

### 🔹 Seller Performance
- **Sales by Seller** (Bar Chart)  
  - Highlights top sellers such as Bharathi, Natesen, and Rajendheran  

### 🔹 Payment Insights
- **Sales by Payment Type** (Donut Chart)  
  - Cash, Mobile Banking, and GPay contribution analysis  

### 🔹 Product Performance
- **Top Cashew Types by Sales** (Bar Chart)  
  - W320 identified as the highest revenue-generating cashew type  

---

## 🧮 Key DAX Measures Used
```DAX
Total Sales =
SUM('Sale&Expenses'[Sale Amount])

Total Expenses =
SUM('Sale&Expenses'[Expenses])

Total Profit =
SUM('Sale&Expenses'[Profit])

Profit Margin % =
DIVIDE([Total Profit], [Total Sales], 0)

Total Quantity =
SUM('Sale&Expenses'[Quantity (in Kg)])

📁 create_tables.sql
/* =====================================================
   CrunchEws Project - Database & Table Creation
   Author: Raguraman V (Raghuu)
   ===================================================== */

-- Create Database
CREATE DATABASE IF NOT EXISTS crunchews_db;
USE crunchews_db;

-- ============================
-- Sales & Expenses Table
-- ============================
CREATE TABLE sale_expenses (
    date_value DATE,
    seller VARCHAR(100),
    cashew_type VARCHAR(50),
    quantity_kg DECIMAL(10,2),
    rate_per_kg DECIMAL(10,2),
    sale_amount DECIMAL(15,2),
    payment_type VARCHAR(50),
    workers VARCHAR(50),
    expenses DECIMAL(15,2)
);

-- ============================
-- Cost / COGS Table
-- ============================
CREATE TABLE cost_data (
    date_value DATE,
    seller VARCHAR(100),
    quantity_kg DECIMAL(10,2),
    amount DECIMAL(15,2),
    cogs DECIMAL(15,2)
);

📁 analysis_queries.sql

/* =====================================================
   CrunchEws Project - Analysis Queries
   ===================================================== */

USE crunchews_db;

-- ============================
-- 1. Total Sales
-- ============================
SELECT 
    SUM(sale_amount) AS total_sales
FROM sale_expenses;

-- ============================
-- 2. Total Expenses
-- ============================
SELECT 
    SUM(expenses) AS total_expenses
FROM sale_expenses;

-- ============================
-- 3. Total Cost (COGS)
-- ============================
SELECT 
    SUM(cogs) AS total_cogs
FROM cost_data;

-- ============================
-- 4. Total Profit
-- Profit = Sale Amount - Expenses
-- ============================
SELECT 
    SUM(sale_amount - expenses) AS total_profit
FROM sale_expenses;

-- ============================
-- 5. Profit Margin (%)
-- ============================
SELECT 
    ROUND(
        (SUM(sale_amount - expenses) / SUM(sale_amount)) * 100,
        2
    ) AS profit_margin_percentage
FROM sale_expenses;

-- ============================
-- 6. Total Quantity Sold
-- ============================
SELECT 
    SUM(quantity_kg) AS total_quantity_kg
FROM sale_expenses;

-- ============================
-- 7. Monthly Sales & Profit Trend
-- ============================
SELECT 
    DATE_FORMAT(date_value, '%Y-%m') AS month,
    SUM(sale_amount) AS monthly_sales,
    SUM(sale_amount - expenses) AS monthly_profit
FROM sale_expenses
GROUP BY month
ORDER BY month;

-- ============================
-- 8. Sales by Seller
-- ============================
SELECT 
    seller,
    SUM(sale_amount) AS total_sales
FROM sale_expenses
GROUP BY seller
ORDER BY total_sales DESC;

-- ============================
-- 9. Sales by Payment Type
-- ============================
SELECT 
    payment_type,
    SUM(sale_amount) AS total_sales
FROM sale_expenses
GROUP BY payment_type
ORDER BY total_sales DESC;

-- ============================
-- 10. Top Cashew Types by Sales
-- ============================
SELECT 
    cashew_type,
    SUM(sale_amount) AS total_sales
FROM sale_expenses
GROUP BY cashew_type
ORDER BY total_sales DESC;

-- ============================
-- 11. COGS vs Sales (Date-wise)
-- ============================
SELECT 
    s.date_value,
    SUM(s.sale_amount) AS total_sales,
    SUM(c.cogs) AS total_cogs
FROM sale_expenses s
JOIN cost_data c
    ON s.date_value = c.date_value
   AND s.seller = c.seller
GROUP BY s.date_value
ORDER BY s.date_value;

-- ============================
-- 12. Seller-wise Profit
-- ============================
SELECT 
    seller,
    SUM(sale_amount - expenses) AS total_profit
FROM sale_expenses
GROUP BY seller
ORDER BY total_profit DESC;


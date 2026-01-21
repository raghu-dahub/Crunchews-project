use crunchews_db;
create database crunchews_db;
CREATE TABLE sale_expenses (
    date_value DATE,
    seller VARCHAR(255),
    cashew_type VARCHAR(100),
    quantity_kg DECIMAL(12,2),
    rate_per_kg DECIMAL(12,2),
    sale_amount DECIMAL(12,2),
    payment_type VARCHAR(100),
    workers VARCHAR(100),
    expenses DECIMAL(12,2)
);
CREATE TABLE cost_table (
    date_value DATE,
    seller VARCHAR(255),
    quantity_kg DECIMAL(12,2),
    amount DECIMAL(12,2),
    cogs DECIMAL(12,2)
);
ALTER TABLE sale_expenses 
CHANGE COLUMN date_value date DATE;
alter table cost_table
change column date_value date date;

select * from sale_expenses;
select * from cost_table;


--- ============================
--- 1. Total Sales
--- ============================
SELECT 
    SUM(sale_amount) AS total_sales
FROM sale_expenses;

--- ============================
--- 2. Total Expenses
--- ============================
SELECT 
    SUM(expenses) AS total_expenses
FROM sale_expenses;

--- ============================
--- 3. Total Cost (COGS)
--- ============================
SELECT 
    SUM(cogs) AS total_cogs
FROM cost_data;

--- ============================
--- 4. Total Profit
--- Profit = Sale Amount - Expenses
--- ============================
SELECT 
    SUM(sale_amount - expenses) AS total_profit
FROM sale_expenses;

--- ============================
--- 5. Profit Margin (%)
--- ============================
SELECT 
    ROUND(
        (SUM(sale_amount - expenses) / SUM(sale_amount)) * 100,
        2
    ) AS profit_margin_percentage
FROM sale_expenses;

--- ============================
--- 6. Total Quantity Sold
--- ============================
SELECT 
    SUM(quantity_kg) AS total_quantity_kg
FROM sale_expenses;

--- ============================
--- 7. Monthly Sales & Profit Trend
--- ============================
SELECT 
    DATE_FORMAT(date_value, '%Y-%m') AS month,
    SUM(sale_amount) AS monthly_sales,
    SUM(sale_amount - expenses) AS monthly_profit
FROM sale_expenses
GROUP BY month
ORDER BY month;

--- ============================
--- 8. Sales by Seller
--- ============================
SELECT 
    seller,
    SUM(sale_amount) AS total_sales
FROM sale_expenses
GROUP BY seller
ORDER BY total_sales DESC;

--- ============================
--- 9. Sales by Payment Type
--- ============================
SELECT 
    payment_type,
    SUM(sale_amount) AS total_sales
FROM sale_expenses
GROUP BY payment_type
ORDER BY total_sales DESC;

--- ============================
--- 10. Top Cashew Types by Sales
--- ============================
SELECT 
    cashew_type,
    SUM(sale_amount) AS total_sales
FROM sale_expenses
GROUP BY cashew_type
ORDER BY total_sales DESC;

--- ============================
--- 11. COGS vs Sales (Date-wise)
--- ===========================
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

--- ============================
--- 12. Seller-wise Profit
--- ============================
SELECT 
    seller,
    SUM(sale_amount - expenses) AS total_profit
FROM sale_expenses
GROUP BY seller
ORDER BY total_profit DESC;

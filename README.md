# ecommerce-sql-analysis
E-commerce sales and customer analytics using SQL and SQLite
# E-Commerce Sales & Customer Analytics using SQL

## Project Overview

This project analyzes e-commerce sales and customer transaction data using SQL and SQLite.

The objective is to understand sales performance, customer purchasing behavior, product performance, order trends, cancellations, and revenue patterns.

## Business Problem

An e-commerce company wants to analyze its transactional data to identify:

- Revenue trends
- Top-performing products
- High-value customers
- Repeat customers
- Customer distribution by city
- Product category performance
- Order cancellation patterns
- Average Order Value

## Tools & Technologies

- SQL
- SQLite
- Eclipse IDE
- GitHub

## Database Schema

The project uses four relational tables:

- Customers
- Orders
- Order Items
- Products

## SQL Analysis

The project includes analysis of:

### Sales Analysis
- Monthly revenue
- Total revenue
- Average Order Value
- Order status
- Cancellation rate

### Customer Analysis
- Revenue by customer
- Repeat customers
- Customers by city
- Top customers

### Product Analysis
- Top products by revenue
- Top products by units sold
- Revenue by category

## SQL Concepts Demonstrated

- SELECT
- WHERE
- INNER JOIN
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- COUNT()
- SUM()
- CASE WHEN
- Aggregate functions
- Conditional aggregation
- Date functions
- Multi-table joins

## Project Structure

```text
ecommerce-sql-analysis/
│
├── 01_create_tables.sql
├── 02_insert_data.sql
├── 03_sales_analysis.sql
├── 04_customer_analysis.sql
├── 05_product_analysis.sql
├── database_schema.png
└── README.md

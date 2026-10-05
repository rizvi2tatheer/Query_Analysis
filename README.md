# Sales Data Analysis with SQL

I did this project to practice SQL on a real-looking sales dataset: filtering, grouping, joins, subqueries, views and indexes. I used MySQL Workbench for everything.

## About the data

The dataset has 2,747 order lines from 298 orders, placed between January 2018 and May 2020. It covers 89 customers, 109 products, 7 product lines and 19 countries. Everything sits in one flat table called `sales_data`, so I used self joins instead of splitting it into separate tables.

## What I did

- **Basic queries:** shipped sales by product line and yearly totals, using WHERE, GROUP BY and ORDER BY.
- **Joins:** INNER, LEFT and RIGHT self joins to find customers who bought from two product lines, customers I lost between 2018 and 2019, and new customers in 2019.
- **Subqueries:** customers who spent more than the average customer, and order lines above the overall average.
- **Aggregates:** SUM and AVG by product line and deal size.
- **Views:** saved the reports I kept reusing (sales by country, monthly sales, top customers).
- **Indexes:** added indexes on the columns I filter and join on, then compared `EXPLAIN` output before and after.

## What I found

Classic Cars brings in the most shipped revenue by a wide margin, at about 3.63M. Vintage Cars (1.65M) and Motorcycles (1.07M) come next. Euro Shopping Channel is the biggest customer at roughly 912K. Total sales across the whole period come to about 9.76M.

One thing to keep in mind: the data stops at 31 May 2020, so 2020 is only a partial year and shouldn't be compared directly with 2018 or 2019.

## Running it yourself

1. Open `load_sales_data.sql` in MySQL Workbench and run it. This creates the `auto_sales_db` database and loads the data.
2. Check that `SELECT COUNT(*) FROM sales_data;` returns 2747.
3. Run `sales_analysis.sql` to go through the queries.

The `screenshots` folder has the output for each task.

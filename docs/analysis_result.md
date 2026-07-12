# Ecommerce-Olist-store-Analysis

## Business Question 1
Which product categories generate the highest revenue and order volume?

---

## Objective
Identify the product categories that contribute the most revenue and order volume to support inventory planning and product portfolio strategy.

---

## Metrics
| Metric        | Definition |
| Revenue       | Total product sales amount (excluding freight and cost) |
| Revenue Share | Percentage of total revenue contributed by each product category |
| Order Count   | Number of distinct orders containing the product category |
| Category AOV  | Average revenue per order containing the product category |

---

## SQL Logic
Data sources:
- olist_order_items_dataset
- olist_products_dataset
- product_category_name_translation


Analysis steps:
1. Join order items with product information.
2. Handle missing product categories.
3. Aggregate revenue by product category.
4. Calculate order count.
5. Calculate revenue share.
6. Calculate category AOV.

---

## Insights
1.	The platform's revenue is highly concentrated in five product categories: health_beauty, watches_gifts, bed_bath_table, sports_leisure, and computers_accessories. Together, these categories contribute approximately 39.74% of the total product sales revenue, indicating that Olist's revenue is primarily driven by a small number of core product categories.
2.	health_beauty is the highest revenue-generating product category, accounting for 9.26% of the total product sales revenue. On average, each order containing products from this category generates R$142.45 in revenue.
3.	bed_bath_table has the highest order volume among all product categories. Although its Category AOV (Average Order Value) ranks 46th out of 74 categories, indicating relatively low revenue per order, its high purchase frequency makes it one of the platform's most in-demand product categories.
4.	Although the computers category has a relatively low order volume, it has the highest Category AOV at approximately R$1,231.84 per order, nearly twice that of the second-ranked category. This indicates that the category is characterized by a high average order value.

---

## Business Recommendation
1.	The top five revenue-generating product categories contribute nearly 40% of the total product sales revenue. Prioritize inventory planning for these core categories to reduce the risk of stockouts and ensure a stable supply of high-performing products.
2.	Although bed_bath_table has the highest order volume, its Category AOV ranks relatively low among all product categories. Consider implementing bundle promotions, minimum-spend discounts, or free shipping incentives to increase the average order value.
3.	Although the computers category has a relatively low order volume, it has the highest Category AOV. Consider offering installment payment options or limited-time promotions to lower customers' purchase barriers and improve conversion rates.

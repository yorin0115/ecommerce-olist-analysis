# Business Question 2
Does the platform exhibit significant periodic sales patterns?

---

## Objective
Analyze periodic sales patterns to identify peak and low-demand periods, understand customer purchasing behavior, and support inventory planning and operational resource allocation.

---

## Metrics

| Metric | Definition |
|---|---|
| Order Year | Year when the order was placed, used for annual comparison and trend analysis |
| Order Month | Month when the order was placed, used to analyze monthly sales patterns |
| Order Weekday | Day of the week when the order was placed, used to analyze weekly sales patterns |
| Order Hour | Hour when the order was placed, used to analyze hourly sales patterns |
| Revenue | Total product sales amount within each time period (excluding freight cost) |
| Revenue Share | Percentage of revenue contributed by each time period within the corresponding year |
| Order Count | Number of unique orders within each time period, used to evaluate customer purchasing activity |
| AOV (Average Order Value) | Average revenue per order (Revenue / Order Count), used to determine whether revenue changes are driven by order volume or spending per order |

---

## Data Limitation

1. During the initial JOIN process, 775 invalid orders were identified, including unavailable (603 orders), canceled (164 orders), created (5 orders), invoiced (2 orders), and shipped (1 order). These invalid orders were excluded from further analysis.

2. Year-over-year (YOY) analysis was not applied because the dataset only contains complete sales records for 2017, while data coverage for 2016 and 2018 is incomplete. Comparing incomplete periods could result in misleading growth rates.

3. To avoid bias caused by incomplete data coverage, this analysis includes orders placed between January 2017 and August 2018. Months with incomplete records (September–December 2016 and September 2018) were excluded.

---

# Insights

## Monthly Analysis

1. In 2017, the top three revenue-generating months were November, December, and October, contributing approximately 39.28% of annual revenue. This indicates that Olist's sales performance was highly concentrated in Q4. The seasonal peak may be related to Black Friday promotions, Christmas shopping activities, and increased holiday purchasing demand.

2. January recorded the lowest revenue in 2017, accounting for only 1.95% of annual revenue. This decline may be related to reduced consumer demand after the Q4 promotional period.

3. In 2018 (January–August), the top three revenue-generating months were March, January, and July. March generated the highest monthly revenue, reaching approximately R$983,213.44. This performance may be associated with seasonal promotions or increased consumer demand during this period.

4. Compared with January 2017, January 2018 improved significantly and ranked as the second-highest revenue month in 2018 (January–August), indicating that the platform maintained stronger sales momentum at the beginning of 2018.

5. From January to August 2018, monthly revenue was higher than the corresponding months in 2017, indicating continued growth in platform sales scale.

---

## Weekly Analysis

1. Weekday analysis shows that revenue performance was generally higher on weekdays compared with weekends, with Monday generating the highest revenue. This indicates that customer purchasing activity was concentrated on weekdays rather than weekends.

---

## Hourly Analysis

1. Hourly analysis shows that orders placed between 13:00 and 16:00 generated higher revenue compared with other periods, with 14:00–14:59 representing the peak revenue hour. In contrast, 00:00–08:00 had the lowest revenue performance, indicating that order activity was mainly concentrated during afternoon hours.

---

# Business Recommendation

1. Since Q4 contributed a significant proportion of annual revenue, proactively plan inventory allocation and logistics capacity before the peak season to ensure sufficient product availability and reduce the risk of stockouts and delivery delays.

2. Launch promotional campaigns or loyalty programs in January to reduce the seasonal decline after Q4 and stimulate customer demand.

3. Since March achieved the highest revenue performance in 2018 (January–August), further analyze whether this growth was driven by specific product categories, promotional activities, or customer purchasing behavior to support future marketing strategies.

4. Implement weekend promotional campaigns, such as limited-time discounts, free shipping, or minimum-spend offers, to improve weekend sales performance and increase customer purchasing willingness.

5. Schedule limited-time promotions and new product launches during the afternoon peak period to align with customer ordering behavior and improve campaign effectiveness.

6. Since 00:00–08:00 represents a low-order-volume and low-revenue period, schedule system maintenance, data updates, and batch processing tasks during this period to minimize disruption during peak transaction hours and maintain a better customer experience.

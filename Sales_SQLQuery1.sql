USE Sales;

SELECT * FROM marketing_campaign;



-- What are the total number of customers in the dataset?
	SELECT COUNT(id) FROM marketing_campaign;
-- What is the average, minimum, and maximum income of customers?
	select round(avg(income),2) as avg_income , max(income) as maximum_income , min(income) as minimum_income
	from marketing_campaign;
-- How many unique levels of education are present in the dataset?
	select distinct(education) from marketing_campaign;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- What is the average total spending for each marital status?
	select avg(total_amount_spent) as Avg_total_money , marital_status
	from marketing_campaign
	group by marital_status;
-- How many customers are in each household size group?
	select count(id) as customer_count , household_size 
	from marketing_campaign
	group by household_size;
-- What is the distribution of customers by age group ?
	SELECT 
    CASE 
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END AS age_group,
    COUNT(id) AS customer_count
FROM marketing_campaign
GROUP BY 
    CASE 
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END;
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- Which category of products (e.g., wine, meat, fruits) has the highest average spending?
	select avg(amount_for_wines) as wines_avg,
		   avg(amount_for_fruits) as fruits_avg,
		   avg(amount_for_meat_products) as meat_avg,
		   avg(amount_for_fish_products) as fish_avg,
		   avg(amount_for_sweet_products) as sweet_avg,
		   avg(amount_for_gold_products) as gold_avg
	from marketing_campaign;
-- What is the total amount spent by customers who responded positively (response = 1)?
	select sum(total_amount_spent) as SUM_TOTAL_AMOUNT
	from marketing_campaign
	where response = 1;
-- How does spending vary between customers with different levels of education?
	select sum(total_amount_spent) as money_total_spent , education
	from marketing_campaign
	group by education
	order by money_total_spent DESC;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- What is the overall response rate of the campaign?
     with one as 
	 (select count(response) AS response_yes_count
	 from marketing_campaign where response =1),
	 two as (
	 select count(response) AS response_no_count
	 from marketing_campaign where response =0)
	 select ((one.response_yes_count*100)/(one.response_yes_count+two.response_no_count)) from one, two;

-- How does the response rate vary across different income levels?
	SELECT 
    CASE 
        WHEN income < 30000 THEN '<30k'
        WHEN income BETWEEN 30000 AND 50000 THEN '30k-50k'
        ELSE '50k+' 
    END AS income_bracket,
    COUNT(CASE WHEN response = 1 THEN 1 END) * 100.0 / COUNT(*) AS response_rate
FROM marketing_campaign
GROUP BY 
    CASE 
        WHEN income < 30000 THEN '<30k'
        WHEN income BETWEEN 30000 AND 50000 THEN '30k-50k'
        ELSE '50k+' 
    END
ORDER BY response_rate DESC;


-- Which marital status group had the highest response rate?
	with one as (
	select count(response) as yes, marital_status
	from marketing_campaign 
	where response =1 
	group by marital_status),
	two as ( 
	select count(response) as summary ,marital_status 
	from marketing_campaign 
	group by marital_status 
	)
	 select  one.marital_status,
    (one.yes * 100.0) / two.summary AS response_rate
	FROM one
	INNER JOIN two ON one.marital_status = two.marital_status
	ORDER BY response_rate DESC
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


-- What is the average number of web visits for customers who made purchases online?
	 select avg(num_of_web__purchase) as result
	 from marketing_campaign
	 where num_of_web__purchase > 0;

	 SELECT marital_status, AVG(num_of_web__purchase) AS avg_web_purchases
FROM marketing_campaign
WHERE num_of_web__purchase > 0
GROUP BY marital_status;

-- How many customers have made at least one purchase in the store?
	 select count(*) as people_count , marital_status
	 from marketing_campaign
	 where num_of_store_purchase >=1
	 group by marital_status;


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- Are there customers with high income but low spending (income_to_spending_ratio)?
	select id, income, total_amount_spent, income_to_spending_ratio from marketing_campaign
	where income > ( select avg(income) from marketing_campaign) and 
		  income_to_spending_ratio < ( select avg(income_to_spending_ratio) from marketing_campaign)

-- What is the recency pattern of customers who responded positively (response = 1)?
    SELECT 
    CASE 
        WHEN recency <= 30 THEN '0-30 days'
        WHEN recency BETWEEN 31 AND 60 THEN '31-60 days'
        WHEN recency BETWEEN 61 AND 90 THEN '61-90 days'
        ELSE '91+ days'
    END AS recency_group,
    COUNT(id) AS customer
FROM marketing_campaign
WHERE response = 1
GROUP BY 
    CASE 
        WHEN recency <= 30 THEN '0-30 days'
        WHEN recency BETWEEN 31 AND 60 THEN '31-60 days'
        WHEN recency BETWEEN 61 AND 90 THEN '61-90 days'
        ELSE '91+ days'
    END;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- Which education level has the highest average income?
	select avg(income)as avg_income,education
	from marketing_campaign
	group by education
	order by avg_income DESC;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


--- Which age group has the highest percentage of positive responses?
SELECT 
    CASE 
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END AS age_group,
    COUNT(CASE WHEN response = 1 THEN 1 END) * 100.0 / COUNT(*) AS positive_response_rate
FROM marketing_campaign
GROUP BY 
    CASE 
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END
ORDER BY positive_response_rate DESC;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- What is the average spending across all product categories for customers who made catalog purchases?
		Select avg(total_amount_spent) as avg_amount
		from marketing_campaign
		where num_of_catalog_purchase > =1

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

-- How does the response rate vary by household size?
SELECT 
    household_size,
    COUNT(CASE WHEN response = 1 THEN 1 END) * 100.0 / COUNT(*) AS response_rate
FROM marketing_campaign
GROUP BY household_size
ORDER BY response_rate DESC;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


--How many customers visited the website but did not make any online purchases?
 select count(*) from marketing_campaign
 where num_of_web_visitsmonth >0 and num_of_web__purchase = 0;

--What is the average number of deals purchases for customers who responded positively?
  select avg(num_of_deals_purchase) from marketing_campaign
  where response =1;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

--Identify customers who have visited the website more than 10 times in the last month but made no purchases.
	Select count(*) as customers from marketing_campaign
	where num_of_web_visitsmonth >10 and num_of_web__purchase =0;

--Are there any significant differences in total spending between customers who filed complaints and those who didn’t?
  with t_one as(select sum(total_amount_spent) as yes_complain
  from marketing_campaign where complain = 1),

  t_two as (select sum(total_amount_spent) as no_complain
  from marketing_campaign where complain = 0)
  
  Select t_one.yes_complain , t_two.no_complain 
  from t_one,t_two;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

---What is the response rate for customers grouped by education and marital_status?
	select count(id) as positive_customers,education, marital_status from marketing_campaign
	where response = 1
	group by education , marital_status
	order by education,positive_customers DESC;


---What is the total income of customers who responded positively compared to those who didn’t?
	with oneone as 
	(select round(sum(income),2) as total_positive_response_income
	from marketing_campaign
	where response = 1),
	okok as (
	select round(sum(income),2) as total_negative_response_income
	from marketing_campaign
	where response = 0)

	select 
	CASE
		when oneone.total_positive_response_income > okok.total_negative_response_income then 'More Income from Positive Response'
		ELSE 'More Income from Negative Response'
		end DECISION,
	oneone.total_positive_response_income , okok.total_negative_response_income
	from oneone , okok;



---What percentage of total spending comes from customers who responded positively (response = 1)?
	with first_one as (select sum(total_amount_spent) as positive_amount 
	from marketing_campaign
	where response = 1),
	second_table as (
	select sum(total_amount_spent) as full_amount
	from marketing_campaign)

	select (first_one.positive_amount *100) / second_table.full_amount as total_amount_percentage_from_positive_response
	from first_one,second_table;

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------


---What percentage of customers who visited the website also made online purchases?
    with aaa as (
	select count(id) as website_online_purchases 
	from marketing_campaign
	where num_of_web_visitsmonth >=1 and num_of_web__purchase>=1),
	bbb as ( 
	select count(*) as all_customers 
	from marketing_campaign)

	select (aaa.website_online_purchases * 100 /bbb.all_customers) as result from aaa,bbb;


---Which engagement channel (e.g., web, store, catalog, deals) contributed the most to total purchases?

SELECT 
    'Web' AS channel, SUM(num_of_web__purchase) AS total_purchases
FROM marketing_campaign
UNION ALL
SELECT 
    'Store' AS channel, SUM(num_of_store_purchase) AS total_purchases
FROM marketing_campaign
UNION ALL
SELECT 
    'Catalog' AS channel, SUM(num_of_catalog_purchase) AS total_purchases
FROM marketing_campaign
UNION ALL
SELECT 
    'Deals' AS channel, SUM(num_of_deals_purchase) AS total_purchases
FROM marketing_campaign
ORDER BY total_purchases DESC;




---What is the average number of website visits for customers with a high income_to_spending_ratio?
  select avg(num_of_web_visitsmonth)
  from marketing_campaign
  where income_to_spending_ratio > (Select avg(income_to_spending_ratio) from marketing_campaign);



---Identify customers who frequently visit the website (num_of_web_visitsmonth > 10) but have low total spending (total_amount_spent < 100).
	select *
	from marketing_campaign
	where num_of_web_visitsmonth >10 and total_amount_spent < ( select avg(total_amount_spent) from marketing_campaign)


---How many customers made purchases in all channels (web, store, and catalog)?
	select count(*) 
	from marketing_campaign
	where num_of_catalog_purchase>=1 and num_of_web__purchase >=1 and num_of_store_purchase>=1;


--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

---What are the spending patterns of customers who responded positively across different product categories?
	SELECT 
    SUM(amount_for_wines) * 100.0 / SUM(total_amount_spent) AS percent_wines,
    SUM(amount_for_fruits) * 100.0 / SUM(total_amount_spent) AS percent_fruits,
    SUM(amount_for_meat_products) * 100.0 / SUM(total_amount_spent) AS percent_meat,
    SUM(amount_for_fish_products) * 100.0 / SUM(total_amount_spent) AS percent_fish,
    SUM(amount_for_sweet_products) * 100.0 / SUM(total_amount_spent) AS percent_sweets,
    SUM(amount_for_gold_products) * 100.0 / SUM(total_amount_spent) AS percent_gold
FROM marketing_campaign
WHERE response = 1;


---Are there customers with high recency (>90 days) who still responded positively? If so, what are their spending habits?
	select * from marketing_campaign
	where recency >90 and response =1


---Analyze the correlation between income and total spending for customers who filed complaints.
	WITH complain_data AS (
    SELECT income, total_amount_spent
    FROM marketing_campaign
    WHERE complain = 1
),
stats AS (
    SELECT 
        COUNT(*) AS n,
        SUM(income) AS sum_x,
        SUM(total_amount_spent) AS sum_y,
        SUM(income * total_amount_spent) AS sum_xy,
        SUM(income * income) AS sum_x2,
        SUM(total_amount_spent * total_amount_spent) AS sum_y2
    FROM complain_data
)
SELECT 
    (n * sum_xy - sum_x * sum_y) / 
    (SQRT((n * sum_x2 - sum_x * sum_x) * (n * sum_y2 - sum_y * sum_y))) AS correlation
FROM stats;


---Which customers have the highest income_to_spending_ratio among those who responded positively?
	select max(income_to_spending_ratio) 
	from marketing_campaign
	where response =1;
	 


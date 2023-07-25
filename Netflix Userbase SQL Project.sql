---- Let's see the data we are working with 
SELECT * FROM dbo.[Netflix Userbase]



---- How much total revene did Netflix make from all these users?
SELECT CONCAT(SUM(monthly_revenue),'$')
FROM dbo.[Netflix Userbase]



---- How much revenue did Netflix make based on the subscription type?
SELECT subscription_type,
       count(user_id) AS users,
	   sum(monthly_revenue) AS revenue
FROM dbo.[Netflix Userbase] 
GROUP BY Subscription_Type



---- What are the age groups Netflix's customers fit in?
SELECT 
     (CASE  
      WHEN age BETWEEN 10 and 20 THEN '10s'
	  WHEN age BETWEEN 20 and 30 THEN '20s'
	  WHEN age BETWEEN 30 AND 40 THEN '30s'
	  WHEN age BETWEEN 40 and 50 THEN '40s'
	  WHEN age BETWEEN 50 and 60 THEN '50s' END),
	  COUNT(user_id) AS users
FROM dbo.[Netflix Userbase]
GROUP BY (CASE  
      WHEN age BETWEEN 10 and 20 THEN '10s'
	  WHEN age BETWEEN 20 and 30 THEN '20s'
	  WHEN age BETWEEN 30 AND 40 THEN '30s'
	  WHEN age BETWEEN 40 and 50 THEN '40s'
	  WHEN age BETWEEN 50 and 60 THEN '50s' END)
ORDER BY (CASE  
      WHEN age BETWEEN 10 and 20 THEN '10s'
	  WHEN age BETWEEN 20 and 30 THEN '20s'
	  WHEN age BETWEEN 30 AND 40 THEN '30s'
	  WHEN age BETWEEN 40 and 50 THEN '40s'
	  WHEN age BETWEEN 50 and 60 THEN '50s' END) ASC



---- Where countries are Netflix's customers coming from?
SELECT country,
       COUNT(user_id) AS total_users
FROM dbo.[Netflix Userbase]
GROUP BY country
ORDER BY COUNT(user_id) DESC



---- What type of devices are Netflix's customers using?
SELECT device,
       COUNT(user_id) AS users_per_device 
FROM dbo.[Netflix Userbase]
GROUP BY device 
ORDER BY COUNT(user_id) DESC


---- Which month brings the most customers?
SELECT MONTH(join_date),
       COUNT(user_id)
FROM dbo.[Netflix Userbase]
GROUP BY MONTH(join_date)
ORDER BY COUNT(user_id) DESC



---- Which gender do our customers identify as?
SELECT gender,
       COUNT(user_id) 
FROM dbo.[Netflix Userbase]
GROUP BY gender 
ORDER BY COUNT(user_id)
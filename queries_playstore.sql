-- Comments in SQL Start with dash-dash --
--selecting analytics table
SELECT * FROM analytics;

--find app with ID of 1880
SELECT * FROM analytics 
  WHERE id = 1880;

-- Find ID and app name of all apps updated on 08-01-18
SELECT id, app_name FROM analytics
   WHERE last_updated = '2018-08-01';

-- Count apps in each category
SELECT category, COUNT(*) FROM analytics 
  GROUP BY category;

-- Find top 5 reviewed apps 
SELECT * FROM analytics 
  ORDER BY reviews DESC 
  LIMIT 5;

-- Find record of app that has most reviews with rating over 4.8
SELECT * FROM analytics 
  WHERE rating >= 4.8 
  ORDER BY reviews DESC
  LIMIT 1;

-- Find avg rating for each category ordered by highest to lowest
SELECT category, AVG(rating) FROM analytics 
  GROUP BY category 
  ORDER BY avg DESC;

-- Find name, price and rating of most expensive app
SELECT app_name, price, rating FROM analytics 
  WHERE rating < 3 
  ORDER BY price DESC 
  LIMIT 1;

-- Find all records with min install below 50 with a rating
SELECT * FROM analytics 
  WHERE min_installs <= 50 
    AND rating IS NOT NULL 
  ORDER BY rating DESC;

-- List app names that are rated less than 3 with at least 10000 reviews
SELECT app_name FROM analytics
  WHERE rating < 3 AND reviews >= 10000;

-- List top 10 more-reviewed apps that costs between 10 cents and 1 dollar
SELECT * FROM analytics
  WHERE price BETWEEN 0.1 and 1 
  ORDER BY reviews DESC 
  LIMIT 10;

-- Find the most out of date app
SELECT * FROM analytics 
  WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- Find the most expensive app
SELECT * FROM analytics 
  WHERE price = (SELECT MAX(price) FROM analytics);

-- Count all reviews in Play Store
SELECT SUM(reviews) AS "All the Reviews" FROM analytics;

-- Find all categories that have more than 300 apps.
SELECT category FROM analytics 
  GROUP BY category 
  HAVING COUNT(*) > 300;

-- Show name, num reviews, min installs and proportion of app with highest amount of reviews to min installs
SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion
  FROM analytics
  WHERE min_installs >= 100000
  ORDER BY proportion DESC
  LIMIT 1;
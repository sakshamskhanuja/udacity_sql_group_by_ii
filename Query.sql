/* For each account, determine the average amount of each type of paper they purchased across
their orders. Your result should have four columns - one for the account name and one for the
average quantity purchased for each of the paper types for each account. */
SELECT a.name AS account, AVG(o.standard_qty) AS avg_stand,
AVG(o.gloss_qty) AS avg_gloss, AVG(poster_qty) poster_qty
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY account;

/* For each account, determine the average amount spent per order on each paper type. Your
result should have four columns - one for the account name and one for the average amount
spent on each paper type. */
SELECT a.name AS account, AVG(o.standard_amt_usd) AS avg_stand,
AVG(o.gloss_amt_usd) AS avg_gloss, AVG(poster_amt_usd) poster_qty
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY account;

/* Determine the number of times a particular channel was used in the web_events table for
each sales rep. Your final table should have three columns - the name of the sales rep, the
channel, and the number of occurrences. Order your table with the highest number of occurrences
first. */
SELECT s.name AS rep, w.channel, COUNT(w.channel) channel_used
FROM sales_reps AS s
JOIN accounts AS a
ON s.id = a.sales_rep_id
JOIN web_events AS w
ON w.account_id = a.id
GROUP BY rep, w.channel
ORDER BY channel_used DESC;

/* Determine the number of times a particular channel was used in the web_events table for each
region. Your final table should have three columns - the region name, the channel, and the number
of occurrences. Order your table with the highest number of occurrences first. */
SELECT r.name AS region, w.channel, COUNT(w.id) AS num_events
FROM region AS r
JOIN sales_reps AS s
ON r.id = s.region_id
JOIN accounts AS a
ON s.id = a.sales_rep_id
JOIN web_events AS w
ON w.account_id = a.id
GROUP BY region, w.channel
ORDER BY num_events DESC;
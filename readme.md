# Ikon Ski Resorts

My project models data that would exist in a company like Ikon who sells season passes that allow access to multiple resorts throughout the world. There are different levels of passes and each resort has unique trails and rental equipment.



<img src="schema.png">



## Query I thought it did well on

**Question**: Which users rented equipment for more than 3 days and which resorts did they visit and what was the total cost of their trip including equipment and lift ticket?

**GPT SQL Response**:
```sql
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    r.name AS resort_name,
    SUM(COALESCE(rental.cost, 0)) + SUM(COALESCE(t.price, 0)) AS total_cost
FROM ikon_users u
JOIN ikon_rentals rental ON u.user_id = rental.user_id
JOIN ikon_lift_tickets t ON u.user_id = t.user_id
JOIN ikon_resorts r ON t.resort_id = r.resort_id
WHERE julianday(rental.return_date) - julianday(rental.rental_date) > 3
GROUP BY u.user_id, r.resort_id;
```

**Friendly Response**: Sure! Here are the users who rented equipment for more than 3 days:

1. Laura Stevenson - Aspen Snowmass: $320.00
2. Bob Jones - Whistler Blackcomb: $330.00




## Question that it tripped up on
The zero shot method produced the wrong result. The SQL was incomplete and gave me the answer of none when there is at least one user each that rented equipment and skis either a blue or black.



Question: What is the ratio of people who rent equipment and ski double black vs those who ski blue? 

**GPT SQL Response**:

```sql
SELECT 
    SUM(CASE WHEN r.equipment_type = 'Ski' AND t.difficulty = 'Double Black' THEN 1 ELSE 0 END) * 1.0 
    NULLIF(SUM(CASE WHEN r.equipment_type = 'Ski' AND t.difficulty = 'Blue' THEN 1 ELSE 0 END), 0) AS ratio\n
FROM ikon_rentals r
JOIN ikon_users u ON r.user_id = u.user_id
JOIN ikon_trails t ON u.skill_level = t.difficulty;
```

**Friendly response**: It looks like there are no records for people who rented equipment and skied double black trails or blue trails. Therefore, the ratio cannot be determined at this time.

## Multi-shot
The sql for the multi-shot approach was much more complex and complete. This is because it had all of the context that was needed to provide the full response and was able to iterative refine its query producing a much more accurate result.

```sql
SELECT
    (SELECT COUNT(DISTINCT user_id)
     FROM ikon_rentals
     WHERE equipment_type IN ('Ski', 'Snowboard')
     AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Double Black'))) AS double_black_rentals,
    (SELECT COUNT(DISTINCT user_id)
     FROM ikon_rentals
     WHERE equipment_type IN ('Ski', 'Snowboard')
     AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Blue'))) AS blue_rentals,
    CASE
        WHEN (SELECT COUNT(DISTINCT user_id)
              FROM ikon_rentals
              WHERE equipment_type IN ('Ski', 'Snowboard')
              AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Blue'))) = 0
        THEN NULL
        ELSE (SELECT COUNT(DISTINCT user_id)
              FROM ikon_rentals
              WHERE equipment_type IN ('Ski', 'Snowboard')
              AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Double Black'))) * 1.0 /
              (SELECT COUNT(DISTINCT user_id)
              FROM ikon_rentals
              WHERE equipment_type IN ('Ski', 'Snowboard')
              AND user_id IN (SELECT user_id FROM ikon_reviews WHERE rating >= 1 AND resort_id IN (SELECT resort_id FROM ikon_trails WHERE difficulty = 'Blue')))
        END AS ratio;
```

**Question (multi-shot)**: What is the ratio of people who rent equipment and ski double black vs those who ski blue? 

SQL Result is [(2, 2, 1.0)]

**Friendly response**: The ratio of people who rent equipment and ski double black to those who ski blue is 2:2, or 1:1.

Overall, the multi-shot performed much better for this question, providing the correct answer.


## Conclusion
I was surprised at the answers that gpt-4.0 mini was able to produce. It created some pretty complex queries and was able to interpret the reuslting answers in a very human-readable fashion. Even with complex questions it performed well with a single exception. Overall, this was very interesting to produce.




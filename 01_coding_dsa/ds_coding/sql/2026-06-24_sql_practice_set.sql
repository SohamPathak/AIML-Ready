-- SQL Practice Set (2026-06-24) — window functions, fresh shapes
-- ================================================================
-- Same table for all problems:
--
-- TABLE: watch_events
--   event_id | user_id | content_id | watch_secs | watched_on   | content_type
--   ---------+---------+------------+------------+--------------+-------------
--      1     |    1    |    A       |   120      | 2026-06-01   |  movie
--      2     |    1    |    B       |   300      | 2026-06-02   |  show
--      3     |    1    |    A       |    45      | 2026-06-04   |  movie
--      4     |    2    |    C       |   600      | 2026-06-01   |  movie
--      5     |    2    |    A       |    30      | 2026-06-03   |  movie
--      6     |    3    |    B       |   500      | 2026-06-02   |  show
--      7     |    3    |    B       |   200      | 2026-06-05   |  show
--      8     |    3    |    C       |    50      | 2026-06-06   |  movie
--
-- ════════════════════════════════════════════════════════════════
-- Q1 (RANK with ties): Rank users by their TOTAL watch time, highest first.
--     Return: user_id, total_secs, user_rank.
--     Hint: aggregate total per user, then RANK() OVER (ORDER BY ... DESC) — no PARTITION needed.
--
-- Your Q1 here:
with total_watch as (select user_id , sum(watch_secs) as total_secs from watch_events groupby user_id ),
select user_id , total_secs , RANK() OVER (order by total_secs sesc ) as user_rank from total_watch




-- ════════════════════════════════════════════════════════════════
-- Q2 (running total — LAG/SUM window): For user 1, show each event in date order
--     with a RUNNING cumulative watch time.
--     Return: user_id, watched_on, watch_secs, running_total.
--     Hint: SUM(watch_secs) OVER (PARTITION BY user_id ORDER BY watched_on)
--
-- Your Q2 here:
with user_1 as (select * from watch_events where user_id = 1 ) ,
select user_id , watched_on , watch_secs , SUM(watch_secs) OVER(order by watched_on) as running_total  from user_1

--or 

select user_id , watched_on , watch_secs , SUM(watch_secs) OVER(partition by user_id order by watched_on) as running_total  from watch_events where user_id =1 




-- ════════════════════════════════════════════════════════════════
-- Q3 (gap analysis — LAG): For each user, find the number of days between
--     each watch event and their PREVIOUS one.
--     Return: user_id, watched_on, days_since_last_watch.
--     Hint: LAG(watched_on) OVER (PARTITION BY user_id ORDER BY watched_on)
--           then subtract.
--
-- Your Q3 here:

with intermediate_table as(select user_id , watched_on , lag(watched_on) over(partition by user_id order by watched_on) as lag_day from watch_events),
select user_id , watched_on , watched_on - COALESCE(lag_day,watched_on) as days_since_last_watch from intermediate_table




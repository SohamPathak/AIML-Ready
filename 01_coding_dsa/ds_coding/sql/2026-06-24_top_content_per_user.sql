-- DS Coding — SQL Drill (2026-06-24)
-- =====================================================
-- Same business question as the pandas drill, now in SQL.
-- This is the #1 DS-coding SQL pattern: "top-N per group" via window functions.
--
-- TABLE: watch_events
--   user_id | content_id | watch_secs | content_type
--   --------+------------+------------+-------------
--     1     |    A       |   120      |  movie
--     1     |    B       |   300      |  show
--     1     |    A       |    45      |  movie
--     2     |    C       |   600      |  movie
--     2     |    A       |    30      |  movie
--     3     |    B       |   500      |  show
--     3     |    B       |   200      |  show
--     3     |    C       |    50      |  movie
--     3     |    A       |   410      |  movie
--
-- TASK: For each user, find the content_type they spent the MOST total
--       watch time on. Return: user_id, top_content_type, total_secs.
--
-- Expected:
--   user_id | top_content_type | total_secs
--   --------+------------------+-----------
--      1    |      show        |    300
--      2    |      movie       |    630
--      3    |      show        |    700
--
-- ─────────────────────────────────────────────────────
-- Write your query below. Think about TWO steps:
--   1. Total watch_secs per (user_id, content_type)   -- GROUP BY
--   2. Pick the top content_type per user             -- window function: RANK/ROW_NUMBER
--
-- Tell me your approach first (which window function and why), then write it.
-- ─────────────────────────────────────────────────────

-- Your query here:

-- Aggregation to get the total secs
with total as (select user_id, content_type ,sum(watch_secs) as total_secs from watch_events group by user_id and content_type) ,
-- Ranking - add a column Rn to rank within each user - desc , use partition to ensure the agg table remains unhampered and a new column is just added
with ranked as (select user_id , content_type , total_secs , ROW_NUMBER() over (partition by user_id order by total_secs desc ) as rn from total ),
-- Extraction just filter by rn = 1
select * from ranked where rn = 1


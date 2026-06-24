-- SQL Drill — "rows above their group's average" (2026-06-24)
-- ============================================================
-- Classic MLE/DS SQL pattern (joins + aggregation + GROUP BY).
--
-- TABLE: employees
--   emp_id | name    | dept     | salary
--   -------+---------+----------+-------
--     1    | Asha    | ML       | 150
--     2    | Ben     | ML       | 120
--     3    | Chen    | ML       | 200
--     4    | Dev     | Data     |  90
--     5    | Eve     | Data     | 110
--     6    | Fay     | Data     | 100
--     7    | Gus     | Infra    | 130
--
-- TASK: Find all employees who earn MORE than the AVERAGE salary of THEIR
--       OWN department. Return: name, dept, salary.
--
-- Dept averages: ML = (150+120+200)/3 = 156.67  |  Data = 100  |  Infra = 130
-- Expected:
--   name | dept | salary
--   -----+------+-------
--   Chen | ML   | 200      (200 > 156.67)
--   Eve  | Data | 110      (110 > 100)
--
-- ─────────────────────────────────────────────────────
-- Two ways to solve (both worth knowing — tell me which you'll use):
--   (a) Subquery/CTE: compute dept avgs, JOIN back, filter salary > avg.
--   (b) Window function: AVG(salary) OVER (PARTITION BY dept), then filter.
-- ─────────────────────────────────────────────────────

-- Your query here:


---answer 1
with intermediate_table as (select name , dept , salary , AVG(salary)over(partition by dept) as avg_salary from employees),
select name , dept , salary from intermediate_table where salary > avg_salary

---answer 2
select emp.name as name , emp.dept as dept , emp.salary as salary from
(select emp.name , emp.dept , emp.salary , lookup.avg_salary 
from employees as emp JOIN 
(select dept , AVG(salary) as avg_salary from employees group by dept) as lookup
on dept)
where emp.salary > lookup.avg_salary

-- ════════════════════════════════════════════════════════════════
-- ✅ REVIEWED 2026-06-24 — 7/10. Both approaches attempted (great instinct).
-- Bugs: trailing CTE comma (ans1); JOIN needs `a.col = b.col` not `on dept` (ans2);
--       derived table needs an alias; ans2 was over-nested.
-- Clean reference solutions:

-- (a) Window function (lead with this):
WITH dept_stats AS (
    SELECT name, dept, salary,
           AVG(salary) OVER (PARTITION BY dept) AS avg_salary
    FROM employees
)                                          -- no comma before final SELECT
SELECT name, dept, salary
FROM dept_stats
WHERE salary > avg_salary;

-- (b) Self-join (no extra nesting needed):
SELECT emp.name, emp.dept, emp.salary
FROM employees AS emp
JOIN (
    SELECT dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept
) AS dept_avg
  ON emp.dept = dept_avg.dept              -- qualify BOTH sides with =
WHERE emp.salary > dept_avg.avg_salary;
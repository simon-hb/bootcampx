SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

/*
The as totals_table part gives an alias to the sub query so that we can use it's name like we would use any other table's name. For example, the first line of that query could be written like this:

SELECT avg(totals_table.total_students) as average_students
(totals_table can be named anything)

In this case, the inner query can contain as many columns as we like:
SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students, cohorts.name as cohort_name
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
) as totals_table;
(we are only extracting total_students, doesn't matter if more columns)
*/
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);

/*
This will return the name of all assignments not completed by 'Ibrahim Schimmel'. nested SELECT is al the assignments ibrahim completed, so we just choose id NOT IN.

SELECT * FROM table
WHERE id IN (
  SELECT something_id
  FROM someTable
  WHERE something
);
*/
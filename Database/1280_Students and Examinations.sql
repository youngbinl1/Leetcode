SELECT st.student_id, st.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students AS st
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e
ON sub.subject_name = e.subject_name AND st.student_id = e.student_id
GROUP BY st.student_id, sub.subject_name
ORDER BY st.student_id, sub.subject_name

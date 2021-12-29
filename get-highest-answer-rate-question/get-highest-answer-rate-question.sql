# Write your MySQL query statement below

with cte AS (
    SELECT q1.question_id, show_count, IFNULL(ans_count,0) AS ans_count
    FROM
    (
        SELECT question_id, COUNT(*) AS show_count
        FROM SurveyLog
        WHERE action = 'show'
        GROUP BY question_id
    ) q1
    LEFT JOIN 
    (
        SELECT question_id, COUNT(*) AS ans_count
        FROM SurveyLog
        WHERE action = 'answer'
        GROUP BY question_id
    ) q2
    ON q1.question_id = q2.question_id
    )

SELECT question_id AS survey_log
FROM (
    SELECT question_id, ans_count/show_count AS ans_rate
    FROM cte
    ORDER BY ans_rate DESC, question_id
    ) q
LIMIT 1

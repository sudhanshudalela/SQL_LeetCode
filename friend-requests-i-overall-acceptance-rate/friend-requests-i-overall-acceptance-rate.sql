# Write your MySQL query statement below

SELECT 
ROUND (
    IFNULL(
    (
        SELECT count(*)
        FROM (
            SELECT DISTINCT requester_id, accepter_id
            FROM RequestAccepted
            ) ra
    )
    /
    (
        SELECT count(*)
        FROM (
            SELECT DISTINCT sender_id, send_to_id
            FROM FriendRequest
            ) fr
    ),0)
,2) AS accept_rate
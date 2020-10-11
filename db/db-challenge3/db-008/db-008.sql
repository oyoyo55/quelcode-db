SELECT user_p.name AS 参加者, c.name AS 参加ルーム, 
       DATE_FORMAT(p.participated_at, '%Y-%m-%d') AS 参加日時
  FROM participations AS p 
  JOIN profiles AS user_p
    ON p.user_id = user_p.user_id
  JOIN chatrooms AS c
    ON p.chatroom_id = c.id
  JOIN users AS u
    ON p.user_id = u.id
 WHERE u.is_deleted = 0
   AND c.is_deleted = 0
ORDER BY p.participated_at ASC
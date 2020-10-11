SELECT COUNT(m.chatroom_id) AS 投稿数,
       c.name AS ルーム名
  FROM messages AS m
  JOIN chatrooms AS c 
    ON m.chatroom_id = c.id
  JOIN users AS u 
    ON (m.create_user_id AND m.update_user_id) = u.id
 WHERE u.is_deleted = 0
   AND m.is_deleted = 0
GROUP BY m.chatroom_id
ORDER BY COUNT(m.chatroom_id) DESC
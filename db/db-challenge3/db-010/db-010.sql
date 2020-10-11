SELECT c.name AS ルーム名, MAX(m.updated_at) AS 投稿日時, p.name AS 投稿者
  FROM messages AS m
  JOIN chatrooms AS c 
    ON m.chatroom_id = c.id
  JOIN profiles AS p 
    ON m.update_user_id = p.user_id
  JOIN users AS u 
    ON (m.create_user_id AND m.update_user_id) = u.id
 WHERE u.is_deleted = 0
   AND m.is_deleted = 0
GROUP BY m.chatroom_id
  HAVING MAX(m.updated_at)
ORDER BY m.chatroom_id ASC

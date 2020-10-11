SELECT id, name, description,
  CASE is_file_sent 
       WHEN 1 THEN '許可'
       WHEN 0 THEN '禁止'
  END AS is_file_sent,
         is_directed, is_deleted, create_user_id, created_at, update_user_id, updated_at
  FROM chatrooms
 WHERE description LIKE '%ダイレクトチャット'
   AND is_deleted = 0;
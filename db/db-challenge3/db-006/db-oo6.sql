SELECT u.id, email, password, name, introduction, business_phone, cell_phone,
       is_deleted, u.created_at, u.updated_at
  FROM users AS u
  JOIN profiles AS p
    ON u.id = p.user_id;
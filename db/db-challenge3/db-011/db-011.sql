BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE 
    tasks
SET 
    is_completed = 1,
    update_user_id = 1,
    updated_at = NOW()
WHERE
-- タスク登録日時が2020/4/26 09:00〜2020/4/26 11:30かつ、削除されていないタスク
    created_at >= '2020-04-26 09:00'
AND
    created_at <= '2020-04-26 11:30'
AND　
    is_deleted = 0
COMMIT;
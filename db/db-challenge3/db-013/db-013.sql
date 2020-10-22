BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE
    users
SET
    is_deleted = 1,
    updated_at = NOW()
WHERE
-- 勤務地、携帯番号ともに登録していないユーザーID
    id NOT IN 
        (
            SELECT
            -- 勤務地、携帯番号のどちらかが登録されているユーザーIDを取得
                user_id 
            FROM
                profiles
            WHERE
                business_phone IS NOT NULL
            OR
                cell_phone IS NOT NULL
        ); 
COMMIT;
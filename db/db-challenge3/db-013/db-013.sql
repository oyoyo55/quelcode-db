BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE
    users
SET
    is_deleted = 1,
    updated_at = NOW()
WHERE
-- 勤務地、携帯番号をともに登録していないユーザーID
    id IN 
        (
            SELECT
            -- 勤務地、携帯番号のどちらかが登録されていないユーザーIDを取得
                user_id 
            FROM
                profiles
            WHERE
                business_phone IS NULL
            OR
                cell_phone IS NULL
        ); 
COMMIT;
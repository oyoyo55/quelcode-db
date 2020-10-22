BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
DELETE
FROM
    participations
WHERE
-- 参加ルーム内の削除されたユーザーID
    user_id IN (
        SELECT
        -- 削除されたユーザーIDを取得
            id
        FROM
            users
        WHERE
            is_deleted = 1
    );
COMMIT;
BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE
    chatrooms
SET
    is_file_sent = 0,
    update_user_id = 1,
    updated_at = NOW()
WHERE
-- admin(user_id=1)が参加していないチャットルームかつ、削除されていないチャットルーム
    id NOT IN  
        (
            SELECT
            -- admin(user_id = 1)が参加したルームIDを取得
                DISTINCT
                chatroom_id 
            FROM
                participations
            WHERE
                user_id = 1
        )
AND
    is_deleted = 0;
COMMIT;
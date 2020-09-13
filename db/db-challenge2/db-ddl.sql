/* usersテーブル作成 */

CREATE TABLE users (
    id         INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    profile_id INTEGER(11) NOT NULL REFERENCES profiles(id),
    email      VARCHAR(100) NOT NULL,
    password   VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL   -- 1:削除済み
);


/* profilesテーブル作成 */

CREATE TABLE profiles (
    id             INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    user_id        INTEGER(11) NOT NULL REFERENCES users(id),
    name           VARCHAR(100) NOT NULL,
    introduction   VARCHAR(1000) NOT NULL,
    business_phone VARCHAR(13),    -- 勤務地電話番号
    cell_phone     VARCHAR(13),    -- 携帯電話番号
    created_at     DATETIME NOT NULL,
    updated_at     DATETIME NOT NULL
);


/*  messagesテーブル作成 */

CREATE TABLE messages (
    id             INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    content        VARCHAR(1000) NOT NULL,
    filename       VARCHAR(100),
    chatroom_id    INT(11) NOT NULL REFERENCES chatrooms(id),
    created_at     DATETIME NOT NULL,
    create_user_id INTEGER(11) NOT NULL REFERENCES users(id),
    updated_at     DATETIME NOT NULL,
    update_user_id INTEGER(11) NOT NULL REFERENCES users(id),
    is_deleted     TINYINT(1) DEFAULT 0 NOT NULL   -- 1:削除済み
);


/*  tasksテーブル作成　*/

CREATE TABLE tasks (
    id             INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    assign_user_id INTEGER(11) NOT NULL REFERENCES users(id),
    chatroom_id    INT(11) NOT NULL REFERENCES chatrooms(id),
    content        VARCHAR(1000) NOT NULL,
    deadline       DATETIME,
    is_completed   TINYINT(1) DEFAULT 0 NOT NULL,   -- 1:完了
    is_deleted     TINYINT(1) DEFAULT 0 NOT NULL,   -- 1:削除済み
    created_at     DATETIME NOT NULL,
    create_user_id INTEGER(11) NOT NULL REFERENCES users(id),
    updated_at     DATETIME NOT NULL,
    update_user_id INTEGER(11) NOT NULL REFERENCES users(id)
);


/*  chatroomsテーブル作成 */

CREATE TABLE chatrooms (
    id             INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(100) NOT NULL,
    description    VARCHAR(1000),
    is_file_sent   TINYINT(1) DEFAULT 0 NOT NULL,   -- 1:送信不可
    is_deleted     TINYINT(1) DEFAULT 0 NOT NULL,   -- 1:削除済み
    is_directed    TINYINT(1) DEFAULT 0 NOT NULL,   -- 1:ダイレクトチャット
    message_id     INTEGER(11) NOT NULL REFERENCES messages(id),
    created_at     DATETIME NOT NULL,
    create_user_id INTEGER(11) NOT NULL REFERENCES users(id),
    updated_at     DATETIME NOT NULL,
    update_user_id INTEGER(11) NOT NULL REFERENCES users(id)
);


/* participationsテーブル作成 */

CREATE TABLE participations (
    chatroom_id   INTEGER(11) REFERENCES chatrooms(id),
    user_id       INTEGER(11) REFERENCES users(id),
    particpate_at DATETIME NOT NULL,      -- 参加日時
    UNIQUE KEY chatroom_id (chatroom_id, user_id),
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
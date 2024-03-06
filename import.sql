-- テーブル bookmarks を作成
CREATE TABLE bookmarks (
    id INTEGER PRIMARY KEY,
    page_name TEXT,
    url TEXT,
    user_id INTEGER
);

-- テーブル users を作成
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT,
    password_hash TEXT,
    email TEXT
);

-- +migrate Up
CREATE TABLE IF NOT EXISTS users (id int);

-- +migrate Down
DROP TABLE IF EXISTS users;
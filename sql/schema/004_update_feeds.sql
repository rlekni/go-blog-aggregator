-- +goose Up
ALTER TABLE feeds
DROP COLUMN IF EXISTS user_id;
-- +goose Down
ALTER TABLE feeds
ADD COLUMN user_id;

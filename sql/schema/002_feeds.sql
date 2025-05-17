-- +goose Up
CREATE TABLE feeds(
  id UUID PRIMARY KEY,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  user_id UUID NOT NULL
);

-- +goose Down
DROP TABLE feeds;

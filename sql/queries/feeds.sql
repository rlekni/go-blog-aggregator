-- name: CreateFeed :one
INSERT INTO feeds (id, created_at, updated_at, name, url, user_id)
VALUES (
    $1,
    $2,
    $3,
    $4,
    $5,
    $6
)
RETURNING *;


-- name: GetAllFeeds :many
SELECT feeds.name AS feed_name, feeds.url, users.name AS user_name
FROM public.feeds
LEFT JOIN users 
ON users.id = feeds.user_id;

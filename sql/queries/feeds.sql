-- name: CreateFeed :one
INSERT INTO feeds (id, created_at, updated_at, name, url)
VALUES (
    $1,
    $2,
    $3,
    $4,
    $5
)
RETURNING *;
--

-- name: GetAllFeeds :many
SELECT *
FROM feeds;
--

-- name: GetFeedByURL :one
SELECT *
FROM public.feeds
WHERE feeds.url = $1;
--

-- name: MarkFeedFetched :exec
UPDATE feeds
SET last_fetched_at = NOW(), updated_at = NOW()
WHERE id = $1;
--

-- name: GetNextFeedToFetch :one
SELECT *
FROM feeds
ORDER BY last_fetched_at ASC NULLS FIRST
LIMIT 1;

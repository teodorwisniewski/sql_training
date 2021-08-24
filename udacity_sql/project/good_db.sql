-- a. Allow new users to register
CREATE TABLE "users"
(
   "id" SERIAL PRIMARY KEY,
   "username" VARCHAR(100) NOT NULL,
   CONSTRAINT "valid_not_empy_username" CHECK (LENGTH(TRIM("username"))>0)
);
-- enforcing uniqueness on "username" column
CREATE UNIQUE INDEX "username_unique_caseinsensitive" ON "users"
(
   LOWER("username")
);



-- b. Allow registered users to create new topics
CREATE TABLE "topics"
(
   "id" SERIAL PRIMARY KEY,
   "topic" VARCHAR(30) UNIQUE NOT NULL,
   "description" VARCHAR(500)
);


-- c. Allow registered users to create new posts on existing topics
CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "topic_id" INTEGER REFERENCES "topics" ("id") ON DELETE CASCADE,
  "user_id" INTEGER REFERENCES "users" ("id") ON DELETE SET NULL,
  "title" VARCHAR(100) NOT NULL,
  "url" VARCHAR(4000),
  "text_content" TEXT,
  "upvotes" INTEGER,
  "downvotes" INTEGER,
   "created_on" TIMESTAMP,
   CONSTRAINT "title_is_not_empty" CHECK (LENGTH(TRIM("title")) > 0)
);


ALTER TABLE "posts"
ADD CONSTRAINT "either_URL_or_text_content"
CHECK
(
   ((LENGTH(TRIM("url")) = 0 OR
   "url" IS NULL) AND
   (LENGTH(TRIM("text_content")) > 0 OR
   "text_content" IS NOT NULL)) OR
   ((LENGTH(TRIM("text_content")) = 0 OR
   "text_content" IS NULL) AND
   (LENGTH(TRIM("url")) > 0 OR
   "url" IS NOT NULL))
);

-- d. Allow registered users to comment on existing posts
CREATE TABLE "comments" (
    "id" SERIAL PRIMARY KEY,
    "parent_comment_id" INTEGER DEFAULT NULL REFERENCES "comments" ON DELETE CASCADE,
	"user_id" INTEGER REFERENCES "users"  ("id") ON DELETE SET NULL,
    "post_id" INTEGER REFERENCES "posts"  ("id") ON DELETE CASCADE,
	"text_content" TEXT NOT NULL,
    "created_on" TIMESTAMP,
    CONSTRAINT "text_content_is_not_empty" CHECK (LENGTH(TRIM("text_content")) > 0)
);


-- e. Make sure that a given user can only vote once on a given post
CREATE TABLE "votes" (
  "user_id" INTEGER REFERENCES "users"  ("id") ON DELETE SET NULL,
   "post_id" INTEGER REFERENCES "posts"  ("id") ON DELETE CASCADE,
   "vote" SMALLINT CHECK ("vote"=1 OR "vote"=-1),
   CONSTRAINT "pb_user_post_votes" PRIMARY KEY ("user_id", "post_id")
);


-- PART III

-- Topic descriptions can all be empty
INSERT INTO "topics" ("topic")
SELECT DISTINCT topic FROM bad_posts;

INSERT INTO "users" ("username")
SELECT DISTINCT "username"
FROM bad_posts
UNION
SELECT DISTINCT "username"
FROM bad_comments
UNION
SELECT DISTINCT regexp_split_to_table(upvotes, ',')
FROM bad_posts
UNION
SELECT DISTINCT regexp_split_to_table(downvotes, ',')
FROM bad_posts;


INSERT INTO "posts" ("user_id", "topic_id", "title", "url", "text_content")
SELECT u."id" user_id,
   t."id" topic_id,
   LEFT(bd."title",100),
   bd."url",
   bd."text_content"
FROM  "bad_posts" bd
JOIN "users" u ON bd.username = u.username
JOIN "topics" t ON  bd.topic = t.topic
;

INSERT INTO "comments" ("user_id", "post_id", "text_content")
SELECT
    u."id" user_id,
    bc."post_id" post_id,
    bc."text_content"
FROM  "bad_comments" bc
JOIN "users" u ON bc.username = u.username
 ;


 INSERT INTO "votes" ("user_id", "post_id", "vote")
    SELECT u.id,
        upvotes_users.id,
        +1 AS upvotes
    FROM (
        SELECT id,
             regexp_split_to_table(upvotes, ',') AS "upvotes_username"
            FROM "bad_posts" bd
    ) upvotes_users
    JOIN "users" u ON upvotes_users."upvotes_username" = u."username"
    UNION
    SELECT u.id,
        downvotes_users.id,
        -1  AS upvotes
    FROM (
        SELECT id,
        regexp_split_to_table(downvotes, ',')
        AS downvotes_username FROM "bad_posts" bd) downvotes_users
    JOIN "users" u ON downvotes_users."downvotes_username" = u."username";

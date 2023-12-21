CREATE TABLE user_profile (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    fullname VARCHAR NOT NULL,
    avatar VARCHAR,
    birthday TIMESTAMP,
    created_time TIMESTAMP NOT NULL
);
INSERT INTO user_profile (username, password, fullname, avatar, birthday, created_time)
VALUES ('user1', 'password1', 'User 1', NULL, NULL, NOW()),
       ('user2', 'password2', 'User 2', NULL, NULL, NOW()),
       ('user3', 'password3', 'User 3', NULL, NULL, NOW()),
       ('user4', 'password4', 'User 4', NULL, NULL, NOW());
-- Tạo bảng friend
CREATE TABLE friend (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    status VARCHAR NOT NULL,
    created_time TIMESTAMP
);

-- Chèn dữ liệu vào bảng friend
INSERT INTO friend (sender_id, receiver_id, status, created_time)
VALUES (1, 2, 'accepted', NOW()),
       (1, 3, 'pending', NOW()),
       (2, 3, 'accepted', NOW()),
       (3, 4, 'rejected', NOW());

-- Tạo bảng message
CREATE TABLE message (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    type VARCHAR NOT NULL,
    content VARCHAR,
    status VARCHAR,
    created_time TIMESTAMP
);

-- Chèn dữ liệu vào bảng message
INSERT INTO message (sender_id, receiver_id, type, content, status, created_time)
VALUES (1, 2, 'text', 'Hello', 'sent', NOW()),
       (1, 2, 'image', 'image.jpg', 'read', NOW()),
       (2, 3, 'text', 'How are you?', 'pending_read', NOW()),
       (3, 1, 'file', 'document.pdf', 'read', NOW());
	   SELECT * FROM user_profile;
	   SELECT * FROM friend;
	   SELECT * FROM message;
	   SELECT * FROM user_profile WHERE username = 'user1';
	  	
		SELECT id, username, fullname, avatar
		FROM user_profile
		WHERE id IN (2, 3);
		
		SELECT up.id, up.username, up.fullname, up.avatar
		FROM friend f
		JOIN user_profile up ON f.receiver_id = up.id
		WHERE f.sender_id = 2;
		
		SELECT id AS message_id, sender_id, receiver_id, type, status, content, created_time
		FROM message
		WHERE (sender_id = 2 AND receiver_id = 3) OR (sender_id = 3 AND receiver_id = 2);
		SELECT up.id, up.username, up.avatar, up.birthday
		
		SELECT up.id, up.username, up.avatar, up.birthday
FROM user_profile up
JOIN (
    SELECT sender_id AS user_id, COUNT(*) AS friend_count
    FROM friend
    GROUP BY sender_id
    UNION ALL
    SELECT receiver_id AS user_id, COUNT(*) AS friend_count
    FROM friend
    GROUP BY receiver_id
) f ON up.id = f.user_id
ORDER BY f.friend_count DESC
LIMIT 10;
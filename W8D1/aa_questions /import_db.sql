
DROP TABLE if EXISTS question_follows;
DROP TABLE if EXISTS question_likes;
DROP TABLE  if exists replies;
DROP TABLE if EXISTS questions;
DROP TABLE if exists users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);



CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE question_follows (
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    body VARCHAR(255),
    subject VARCHAR(255),
    parent_id INTEGER,
    question_id INTEGER NOT NULL, 

    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE question_likes (
    likes BOOLEAN NOT NULL,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('nicole', 'ohanian'),
    ('kenny', 'lawrence'),
    ('freddie', 'petes'),
    ('jennie', 'richardson'),
    ('teddy', 'rosie');

INSERT INTO 
    questions (title, body, user_id)
VALUES
    ('sql learning q''s','What is sql?', (SELECT users.id FROM users WHERE fname = 'kenny') ),
    ('ruby learning q''s','What is ruby', (SELECT users.id FROM users WHERE fname = 'nicole') ),
    ('rails learning q''s','What is rails?', (SELECT users.id FROM users WHERE fname = 'jennie') );

INSERT INTO 
    question_follows (question_id, user_id)
VALUES
    (1, 5), 
    (1, 4),
    (1, 3),
    (1, 2),
    (1, 1),
    (3, 5), 
    (3, 4),
    (3, 3),
    (2, 2),
    (2, 1);

INSERT INTO 
    replies (user_id, body, subject, question_id)
VALUES
    (3, 'I love SQL!!! It''s a very useful database lanaguage!', 'LOVE', 1),
    (5, 'I <3 RUBY', 'Rubylove', 3);
    

INSERT INTO 
    replies
    (user_id, body, subject, parent_id, question_id)
VALUES
    (2, 'I love SQL too!!!!!', 'LOVE', (SELECT replies.id
                                        FROM replies
                                        WHERE parent_id IS NULL AND subject='Love'), 1),
    (4, 'Isn''t it the best?', 'Rubylove', (SELECT replies.id
                                        FROM replies
                                        WHERE parent_id IS NULL AND subject='Rubylove'), 3);

INSERT INTO question_likes (likes, question_id, user_id)
VALUES
    (true, 1, 5), 
    (true, 1, 4),
    (true, 1, 3),
    (true, 1, 2),
    (true, 1, 1),
    (true, 3, 5), 
    (true, 3, 4),
    (true, 3, 3),
    (true, 2, 2),
    (true, 2, 1);

                                        
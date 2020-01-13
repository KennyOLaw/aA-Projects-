DROP TABLE cattoys;
DROP TABLE cats;
DROP TABle toys;

CREATE TABLE cats(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  breed VARCHAR(255) NOT NULL
);

CREATE TABLE toys(
  id SERIAL PRIMARY KEY,
  price INTEGER,
  color VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE cattoys(
  id SERIAL PRIMARY KEY,
  cat_id INTEGER NOT NULL,
  toy_id INTEGER NOT NULL,
  FOREIGN KEY(cat_id) REFERENCES cats(id),
  FOREIGN KEY(toy_id) REFERENCES toys(id)
);

-- INSERT INTO table_name
--     (column1, column2, column3, ...)
-- VALUES
--     (value1, value2, value3, ...);
INSERT INTO cats
    (name, color, breed)
VALUES
    ('patchs','calico', 'ragdoll'),
    ('tommy', 'black', 'bombay'),
    ('cily', 'red', 'hemal'),
    ('jack', 'white', 'japaness bobtail'),
    ('garfield', 'ginger', 'tomcat');

INSERT INTO toys
    (price, color, name)
VALUES 
    (5, 'pink', 'mouse'),
    (9, 'red/black', 'nipball'),
    (19, 'red', 'lazer'),
    (15, 'rainbow', 'feather stick'),
    (50, 'grey', 'catpost');

INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    ((SELECT id
    FROM cats
    WHERE name = 'patchs'),
    (SELECT id
    FROM toys
    WHERE name = 'mouse')
    ),
    ((SELECT id
    FROM cats
    WHERE name = 'tommy'),
    (SELECT id
    FROM toys
    WHERE name = 'nipball')
    ),
    ((SELECT id
    FROM cats
    WHERE name = 'cily'),
    (SELECT id
    FROM toys
    WHERE name = 'lazer')
    ),
    ((SELECT id
    FROM cats
    WHERE name = 'jack'),
    (SELECT id
    FROM toys
    WHERE name = 'feather stick')
    ),
    ((SELECT id
    FROM cats
    WHERE name = 'garfield'),
    (SELECT id
    FROM toys
    WHERE name = 'catpost')
    );
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condi


SELECT 
toys.name
FROM
toys
JOIN

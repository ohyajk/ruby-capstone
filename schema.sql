CREATE DATABASE ruby_database;

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  label INT REFERENCES label(id),
  publish_date DATE,
  archived BOOLEAN 
);


CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE books (
  id  INT,
  title VARCHAR(100),
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY(id) REFERENCES item(id)
);


CREATE TABLE music_albums (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  on_spotify BOOLEAN NOT NULL,
  genre_id INTEGER,
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE genres (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id), , 
  publish_date DATE, 
  multiplayer BOOLEAN,
  last_played_at DATE, 
);

CREATE TABLE author (
  id INT PRIMARY KEY, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50)
);

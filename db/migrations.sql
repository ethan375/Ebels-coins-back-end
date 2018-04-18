CREATE DATABASE coinsite;

\c coinsite

CREATE TABLE coins(
  id SERIAL PRIMARY KEY,
  denomination VARCHAR(255),
  series VARCHAR(255),
  year VARCHAR(255),
  composition VARCHAR(255),
  mint VARCHAR(255)
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  password_digest VARCHAR(60)
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  body VARCHAR(255)
);
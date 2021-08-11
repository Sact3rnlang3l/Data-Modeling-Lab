CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "user_email" varchar(50),
  "user_pw" varchar(30),
  "user_name" varchar(20),
  "user_recipes" text
);

CREATE TABLE "recipes" (
  "recipe_id" SERIAL PRIMARY KEY,
  "ingredient" int NOT NULL,
  "creator" int NOT NULL,
  "recipe_name" int NOT NULL,
  "recipe_insctructions" int NOT NULL
);

CREATE TABLE "instrct" (
  "instrct_id" SERIAL PRIMARY KEY,
  "instrct_deets" text
);

CREATE TABLE "ingredients" (
  "ingredients_id" SERIAL PRIMARY KEY,
  "ingredient_name" text
);

CREATE TABLE "recipe_ingredients" (
  "recipe_ingredients_id" int NOT NULL,
  "ingred_id" int NOT NULL
);

CREATE TABLE "grocery" (
  "user_id" int NOT NULL,
  "ingredient_id" int NOT NULL
);

CREATE TABLE "occassion" (
  "occasion_id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL,
  "recipe_id" int NOT NULL,
  "occassion_deets" text
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("ingredient") REFERENCES "ingredients" ("ingredients_id");

ALTER TABLE "recipes" ADD FOREIGN KEY ("creator") REFERENCES "users" ("user_name");

ALTER TABLE "recipes" ADD FOREIGN KEY ("recipe_name") REFERENCES "users" ("user_recipes");

ALTER TABLE "recipes" ADD FOREIGN KEY ("recipe_insctructions") REFERENCES "instrct" ("instrct_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("recipe_ingredients_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("ingred_id") REFERENCES "ingredients" ("ingredients_id");

ALTER TABLE "grocery" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "grocery" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("ingredients_id");

ALTER TABLE "occassion" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "occassion" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

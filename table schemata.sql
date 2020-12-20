-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "title" (
    "show_id" int   NOT NULL,
    "show_type" varchar(255)   NOT NULL,
    "title" varchar(500)   NOT NULL,
    "date_added" varchar(255)   NOT NULL,
    "release_year" varchar(255)   NOT NULL,
    "pg_rating" int   NOT NULL,
    "duration" varchar(255)   NOT NULL,
    "description" varchar(255)   NOT NULL,
    "IMDB_rating" varchar(255)   NOT NULL,
    "Rotten_Tomatoes_rating" int   NOT NULL,
    "Award" varchar(255)   NOT NULL,
    "Released_Date" varchar(255)   NOT NULL,
    "Budget" float   NOT NULL,
    "Movie_ID" int   NOT NULL,
    "Revenue" float   NOT NULL,
    "Origknal_lang" char(2)   NOT NULL
);

CREATE TABLE "title_country" (
    "show_id" int   NOT NULL,
    "country_id" int   NOT NULL,
    CONSTRAINT "pk_title_country" PRIMARY KEY (
        "show_id","country_id"
     )
);

CREATE TABLE "country" (
    "country_id" int   NOT NULL,
    "country_name" varchar(500)   NOT NULL,
    "country_shortname" varchar(4)   NOT NULL,
    "longitude" varchar(15)   NOT NULL,
    "latitude" varchar(15)   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "Listed_in" (
    "listed_in_id" int   NOT NULL,
    "listed_in_name" varchar(500)   NOT NULL,
    CONSTRAINT "pk_Listed_in" PRIMARY KEY (
        "listed_in_id"
     )
);

CREATE TABLE "listed_in_title" (
    "listed_in_id" int   NOT NULL,
    "show_id" int   NOT NULL,
    CONSTRAINT "pk_listed_in_title" PRIMARY KEY (
        "listed_in_id","show_id"
     )
);

CREATE TABLE "director" (
    "director_id" int   NOT NULL,
    "director_name" varchar(500)   NOT NULL,
    CONSTRAINT "pk_director" PRIMARY KEY (
        "director_id"
     )
);

CREATE TABLE "director_title" (
    "show_id" int   NOT NULL,
    "director_id" int   NOT NULL,
    CONSTRAINT "pk_director_title" PRIMARY KEY (
        "show_id","director_id"
     )
);

CREATE TABLE "players" (
    "player_id" int   NOT NULL,
    "player_name" varchar(500)   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "player_title" (
    "player_id" int   NOT NULL,
    "show_id" int   NOT NULL,
    CONSTRAINT "pk_player_title" PRIMARY KEY (
        "player_id","show_id"
     )
);

CREATE TABLE "pg_rating" (
    "pg_rating_id" int   NOT NULL,
    "pg_rating_name" varchar(20)   NOT NULL,
    CONSTRAINT "pk_pg_rating" PRIMARY KEY (
        "pg_rating_id"
     )
);

ALTER TABLE "title" ADD CONSTRAINT "fk_title_pg_rating" FOREIGN KEY("pg_rating")
REFERENCES "pg_rating" ("pg_rating_id");

ALTER TABLE "title_country" ADD CONSTRAINT "fk_title_country_show_id" FOREIGN KEY("show_id")
REFERENCES "title" ("show_id");

ALTER TABLE "title_country" ADD CONSTRAINT "fk_title_country_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "listed_in_title" ADD CONSTRAINT "fk_listed_in_title_listed_in_id" FOREIGN KEY("listed_in_id")
REFERENCES "Listed_in" ("listed_in_id");

ALTER TABLE "listed_in_title" ADD CONSTRAINT "fk_listed_in_title_show_id" FOREIGN KEY("show_id")
REFERENCES "title" ("show_id");

ALTER TABLE "director_title" ADD CONSTRAINT "fk_director_title_show_id" FOREIGN KEY("show_id")
REFERENCES "title" ("show_id");

ALTER TABLE "director_title" ADD CONSTRAINT "fk_director_title_director_id" FOREIGN KEY("director_id")
REFERENCES "director" ("director_id");

ALTER TABLE "player_title" ADD CONSTRAINT "fk_player_title_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("player_id");

ALTER TABLE "player_title" ADD CONSTRAINT "fk_player_title_show_id" FOREIGN KEY("show_id")
REFERENCES "title" ("show_id");


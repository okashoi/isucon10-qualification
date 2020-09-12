DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo COLLATE utf8mb4_general_ci;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
	    id          INTEGER             NOT NULL PRIMARY KEY,
	    name        VARCHAR(64)         NOT NULL,
	    description VARCHAR(4096)       NOT NULL,
	    thumbnail   VARCHAR(128)        NOT NULL,
	    address     VARCHAR(128)        NOT NULL,
	    latitude    DOUBLE PRECISION    NOT NULL,
	    longitude   DOUBLE PRECISION    NOT NULL,
	    rent        INTEGER             NOT NULL,
	    door_height INTEGER             NOT NULL,
	    door_width  INTEGER             NOT NULL,
	    features    VARCHAR(64)         NOT NULL,
	    popularity  INTEGER             NOT NULL,
	    INDEX estate_rent (rent),
	    INDEX estate_popularity (popularity),
	    INDEX estate_door_height (door_height),
	    INDEX estate_door_width (door_width),
	    INDEX estate_point (latitude, longitude)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE isuumo.chair
(
	    id          INTEGER         NOT NULL PRIMARY KEY,
	    name        VARCHAR(64)     NOT NULL,
	    description VARCHAR(4096)   NOT NULL,
	    thumbnail   VARCHAR(128)    NOT NULL,
	    price       INTEGER         NOT NULL,
	    height      INTEGER         NOT NULL,
	    width       INTEGER         NOT NULL,
	    depth       INTEGER         NOT NULL,
	    color       VARCHAR(64)     NOT NULL,
	    features    VARCHAR(64)     NOT NULL,
	    kind        VARCHAR(64)     NOT NULL,
	    popularity  INTEGER         NOT NULL,
	    stock       INTEGER         NOT NULL,
	    INDEX chair_price (price),
	    INDEX chair_kind_stock (kind, stock),
	    INDEX chair_popularity (popularity)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

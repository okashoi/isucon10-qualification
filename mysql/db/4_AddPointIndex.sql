ALTER TABLE isuumo.estate ADD coords Point;

UPDATE  isuumo.estate
SET     coords = Point(latitude, longitude);

-- タイムアウトしてしまうのでコメントアウト
-- ALTER TABLE isuumo.estate MODIFY coords Point NOT NULL;
-- CREATE SPATIAL INDEX estate_coords ON isuumo.estate(coords);

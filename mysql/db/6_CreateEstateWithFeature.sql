DROP TABLE IF EXISTS isuumo.estate_with_feature;

create table isuumo.estate_with_feature (
    estate_id integer not null,
    estate_feature_id integer not null,
    primary key (estate_id, estate_feature_id)
);
#!/bin/bash
set -xe
set -o pipefail

exportMYSQL_HOST=${MYSQL_HOST:-127.0.0.1}
MYSQL_PORT=${MYSQL_PORT:-3306}
MYSQL_USER=${MYSQL_USER:-isucon}
MYSQL_DBNAME=${MYSQL_DBNAME:-isuumo}
MYSQL_PWD=${MYSQL_PASS:-isucon}
export LANG="C.UTF-8"
cd /opt/dbseed/

cat 0_Schema.sql 1_DummyEstateData.sql 2_DummyChairData.sql | mysql --defaults-file=/dev/null -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME -pisucon

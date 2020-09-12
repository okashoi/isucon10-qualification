#!/bin/bash
set -xe
set -o pipefail

export MYSQL_HOST=${MYSQL_HOST:-localhost}
export MYSQL_PORT=${MYSQL_PORT:-3306}
export MYSQL_USER=${MYSQL_USER:-isucon}
export MYSQL_DBNAME=${MYSQL_DBNAME:-isuumo}
export MYSQL_PWD=${MYSQL_PASS:-isucon}
export LANG="C.UTF-8"
cd /opt/dbseed/

cat 0_Schema.sql 1_DummyEstateData.sql 2_DummyChairData.sql 3_CreateOutofstockChair.sql 4_AddPointIndex.sql | mysql --defaults-file=/dev/null -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME -pisucon

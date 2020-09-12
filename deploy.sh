#!/bin/bash -eu

# アプリケーションのビルド
cd /home/isucon/isuumo/webapp/go
make

# 各種サービス停止
sudo systemctl stop nginx
sudo systemctl stop isuumo.go.service
sudo systemctl stop mysql

# ログのクリーンアップ
echo ''  | sudo tee /var/log/mysql/slow.log /var/log/nginx/access.log

# 各種サービス起動
sudo systemctl start mysql
sudo systemctl start isubata.golang.service
sudo systemctl start nginx

# slow query log の設定
sudo mysql << EOF
set global slow_query_log_file = '/var/log/mysql/slow.log';
set global long_query_time = 0.1;
set global slow_query_log = ON;
set global log_queries_not_using_indexes = ON;
EOF

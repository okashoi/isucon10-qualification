#!/bin/bash

# http://lhcpr.hatenablog.com/entry/2018/09/03/143702
cat <<'EOF' | mysql -uroot
CREATE USER 'isucon'@'%' IDENTIFIED BY 'isucon';
GRANT ALL privileges ON *.* TO 'isucon'@'%';
flush privileges;
show grants for 'isucon';
select host, user from mysql.user;
EOF

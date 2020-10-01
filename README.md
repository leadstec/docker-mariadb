# MariaDB image for VCubi Platform

![MariaDB](https://img.shields.io/badge/mariadb-10.4.13,_latest-blue)
![x86_64](https://img.shields.io/badge/x86_64-supported-brightgreen)
![aarch64](https://img.shields.io/badge/aarch64-supported-brightgreen)

The project contains MariaDB image for VCubi platform, based on LCS container management daemon.

## How to Use

### Pull image
    # from Docker Hub
    docker pull leadstec/mariadb:[tag]
    docker pull leadstec/mariadb-aarch64:[tag]
    # from Tencent CR
    docker pull leadstec.tencentcloudcr.com/leadstec/mariadb:[tag]
    docker pull leadstec.tencentcloudcr.com/leadstec/mariadb-aarch64:[tag]

### Build image
    docker-compose build mariadb

### LCS Schema & ENV

| ENV Variable              | Description               | Default | Accept Values | Required |
|---------------------------|---------------------------|---------|---------------|----------|
| MARIADB_REMOTE_ADMIN_USER |                           |  admin  |     |          |
| MARIADB_DB_USER           |                           |  dbuser |               |          |
| MARIADB_DB_NAME           |                           |   mydb  |               |          |
| MARIADB_DB_CHARSET        |                           |   utf8  |               |          |
| MARIADB_DB_CHARSET_COLLATE|                           | utf8_general_ci |       |          |
| MARIADB_KEY_BUFFER_SIZE   |                           |   16M   |               |          |
| MARIADB_MAX_ALLOWED_PACKET|                           |   16M   |     |          |
| MARIADB_TABLE_OPEN_CACHE  |                           |   64    |     |          |
| MARIADB_SORT_BUFFER_SIZE  |                           |   512K  |     |          |
| MARIADB_NET_BUFFER_LENGTH |                           |    8K   |     |          |
| MARIADB_READ_BUFFER_SIZE  |                           |   256K  |     |          |
| MARIADB_READ_RND_BUFFER_SIZE  |                       |   512K  |     |          |
| MARIADB_INNODB_BUFFER_POOL_SIZE   |                   |   64M   |     |          |
| MARIADB_INNODB_LOG_FILE_SIZE  |                       |   5M    |     |          |
| MARIADB_INNODB_LOG_BUFFER_SIZE|                       |   8M    | | |
| MARIADB_INNODB_LOCK_WAIT_TIMEOUT  |                   |   50    |      |          |

## Image Structure Test
    container-structure-test test --image leadstec/mariadb:tag --config tests/mariadb.yaml

## CHANGELOG

**2020/10/02**
* Update: MariaDB 10.4.13

**2020/01/16**
* Update - MariaDB 10.4.10

**2019/12/13**
* Update to 10.3.20
* There is a file system issue while running in Mac, volume problem seems not going to be solved.

**10.1.32 2018-11-28**
* 更新 lcs 1.6.2，支持 compose v2/v3
* MARIADB_REMOTE_ADMIN 是必须的，去掉选择

**10.1.32**
* 更新版本
* 支持aarch64架构

**10.1.28**
* 更新2018年
* just update alpine to 3.7

**10.1.22**
* 发布到leadstec.cangku.cloud
* Production Release

**10.1.21**

* 基于alpine 3.5（LCS 1.4）

**10.1.20**

* 基于alpine 3.5（LCS 1.3）

**10.1.17**

* mariadb 版本升级

**10.1.14**

* 支持LCS 1.2.0

**10.1.12**

* 支持Image Schema
* 支持LCS Tools
* 取消update后加database的机制
* 本地管理员改为root（取消dbadmin）

**5.5.43**

* 5.5.43-25
    - Production Ready
    - 支持captool机制
* 5.5.43
    - 基于alpine:3.2.3，大幅度减少image体积
    - 删除custom.sh 错误删除mysql.sock的问题（后续版本再解决sock占用问题）

**5.5.41**

* 5.5.41-5
    - 修复通知逻辑的错误
* 5.5.41-4
    - 基于base:0.6.2
    - 支持/data/db做指定目录volume mapping
    - MariaDB的Log，默认在/data/log/mariadb，方便统一logging
* 5.5.41-3
    - 基于base:0.6.1
    - 删除/setup目录
* 5.5.41-2
    - 基于base:0.6.0
    - 根据base:0.6的思路，简化首次启动脚本为runonce.sh
* 5.5.41-1
    - 基于base:0.5.2

**采用MariaDB版本号**

**0.4.1**

* Based on image reg.leadstec.com/base:0.4.1 (Refer to base/0.4.1 for details)
* Remove EXPOSE ports from Dockerfile, please map ports while creating the container

**0.4**

* Combine dev and runtime into one image.
* Based on image reg.leadstec.com/base:0.4 (Refer to base/0.4 for details)

**0.3.2**

* Support for existing databases migration
* change data directory to /data/db

**0.3.1**

* Bug fixed on 0.3 run script about starting supervisord.

**0.3**

* Update to use supervisorctl control processes within container and prevent restart container frequently.

**0.2**

* Based on reg.leadstec.com/dev:0.2
** Dockerfile support up to docker version 1.2+

**0.1**

* initial image
* Set mariadb server character-set-server to utf8 by default
* Set mariadb server collation-server to utf8_unicode_ci by default
* Set mariadb client default-character-set to utf8 by default

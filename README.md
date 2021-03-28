# MariaDB image for VCubi platform

![Version](https://img.shields.io/badge/MariaDB-10.5.8-blue)
![Arch](https://img.shields.io/badge/Arch-amd64,_arm64-brightgreen)
![Workflow](https://github.com/leadstec/docker-mariadb/workflows/ci/badge.svg)

The project contains MariaDB image for VCubi platform, based on LCS container management daemon.

Image on [DockerHub](https://hub.docker.com/r/leadstec/mariadb)

LEADSTEC: [Official website](https://www.leadstec.com)

## How to Use
    # Pull image
    docker pull leadstec/mariadb:latest

    # Build image
    docker-compose build

    # Image Structure Test
    container-structure-test test --image leadstec/mariadb:tag --config tests/mariadb.yml


### LCS Schema & ENV

| ENV Variable              | Description               | Default | Accept Values |
|---------------------------|---------------------------|---------|---------------|
| MARIADB_REMOTE_ADMIN_USER |                           |  admin  |     |
| MARIADB_DB_USER           |                           |  dbuser |               |
| MARIADB_DB_NAME           |                           |   mydb  |               |
| MARIADB_DB_CHARSET        |                           |   utf8  |               |
| MARIADB_DB_CHARSET_COLLATE|                           | utf8_general_ci |       |
| MARIADB_KEY_BUFFER_SIZE   |                           |   16M   |               |
| MARIADB_MAX_ALLOWED_PACKET|                           |   16M   |     |
| MARIADB_TABLE_OPEN_CACHE  |                           |   64    |     |
| MARIADB_SORT_BUFFER_SIZE  |                           |   512K  |     |
| MARIADB_NET_BUFFER_LENGTH |                           |    8K   |     |
| MARIADB_READ_BUFFER_SIZE  |                           |   256K  |     |
| MARIADB_READ_RND_BUFFER_SIZE  |                       |   512K  |     |
| MARIADB_INNODB_BUFFER_POOL_SIZE   |                   |   64M   |     |
| MARIADB_INNODB_LOG_FILE_SIZE  |                       |   5M    |     |
| MARIADB_INNODB_LOG_BUFFER_SIZE|                       |   8M    |     |
| MARIADB_INNODB_LOCK_WAIT_TIMEOUT  |                   |   50    |     |


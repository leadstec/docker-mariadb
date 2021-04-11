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
| MARIADB_REMOTE_ADMIN_USER |                           |  root   |     |
| MARIADB_DB_USER           |                           |  dbuser |               |
| MARIADB_DB_NAME           |                           |   mydb  |               |
| MARIADB_CHARACTER_SET     |                           |   utf8  |               |
| MARIADB_COLLATION         |                           | utf8_general_ci |       |
| MARIADB_MAX_ALLOWED_PACKET|                           |   16M   |     |
| MARIADB_TABLE_OPEN_CACHE  |                           |  2000   |     |
| MARIADB_SORT_BUFFER_SIZE  |                           |   2M  |     |
| MARIADB_NET_BUFFER_LENGTH |                           |    16K  |     |
| MARIADB_INNODB_BUFFER_POOL_SIZE   |                   |   512M  |     |
| MARIADB_INNODB_LOG_FILE_SIZE  |                       |   96M   |     |
| MARIADB_INNODB_FLUSH_METHOD   |                       | fsync | | 
| MARIADB_INNODB_LOCK_WAIT_TIMEOUT  |                   |   50    |     |


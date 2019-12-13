#!/bin/bash

function wait_for_database() {
    printf "Waiting for MariaDB to start ..."
    RET=1
    while [[ $RET -ne 0 ]]; do
        printf "."
        sleep 5
        mysql -uroot -e "status" > /dev/null 2>&1
        RET=$?
    done
    printf "Connected\n"
}

function add_database() {
    if [[ -n ${MARIADB_DB_NAME} ]]; then
        # start mariadb server
        /usr/bin/mysqld_safe --user mysql > /dev/null 2>&1 &
        # wait for mariadb to start
        wait_for_database

        for db in $(awk -F',' '{for (i = 1 ; i <= NF ; i++) print $i}' <<< "${MARIADB_DB_NAME}");
            do
                # check whether it is already exist
                if [[ ! -d ${DB_DIR}/$db ]]; then
                    mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`$db\` DEFAULT CHARACTER SET \`${MARIADB_DB_CHARSET}\` COLLATE \`${MARIADB_DB_CHARSET_COLLATE}\`;"
                    mysql -uroot -e "GRANT ALL PRIVILEGES ON \`$db\`.* TO '${MARIADB_DB_USER}' IDENTIFIED BY '{{MARIADB_DB_PASS}}';"
                    clog -i "mariadb: Database \"$db\" and grant access to user \"${MARIADB_DB_USER}\" created."
                else
                    clog -i "mariadb: Database \"$db\" already exist, skip creation."
                fi
            done

        # shutdown mariadb to wait for supervisor
        mysqladmin -u root shutdown
        clog -i "mariadb: Add user Database Initialized."
        clog -i "mariadb: Shutdown mariadb to wait for supervisor"
    fi
}

# Determine new install or updating
if [[ ${SETUP_MODE} == 'new' ]]; then
    # initialize mariadb
    mysql_install_db --user=mysql --ldata=${DB_DIR} > /dev/null
    clog -i "mariadb: Database engine initialized."

    # start mariadb server
    /usr/bin/mysqld_safe --user mysql > /dev/null 2>&1 &
    # wait for database server coming up
    wait_for_database

    # 1. Create a localhost-only root account
    # 2. if needed, Create remote db admin account with root privilieges
    # 3. if set, create a database with specific username and password
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '' WITH GRANT OPTION;"
    clog -i "mariadb: Grant access to root for localhost only."

    # remote admin
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_REMOTE_ADMIN_USER}'@'%' IDENTIFIED BY '{{MARIADB_REMOTE_ADMIN_PASS}}' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    clog -i "mariadb: remote admin user with root privileges created."

    # shutdown mariadb to wait for supervisor
    mysqladmin -u root shutdown

    # Create specific user/database
    add_database
else
    # custom code when restore
    #Resolve:Permission denied.When the time to restore
    mkdir -p /run/mysqld
    chown mysql:mysql  /run/mysqld
    clog -t "MariaDB: Permission is fixed successfully."
    clog -i "mariadb: Persist storage restored."
fi

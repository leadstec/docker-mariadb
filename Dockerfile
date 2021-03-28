#
# Author            Frank,H.L.Lai <frank@leadstec.com>
# Docker Version    20.10
# Website           https://www.leadstec.com
# Copyright         (C) 2021 LEADSTEC Systems. All rights reserved.
#
FROM leadstec/alpine:3.13.3

LABEL description="MariaDB image for VCubi platform" \
    maintainer="Frank,H.L.Lai <frank@leadstec.com>"

# set environment variables
ENV MARIADB_LOG_DIR="${LOG_DIR}/mariadb"

# Install packages
RUN apk --update add mariadb mariadb-client && \
    rm /var/cache/apk/*

# add install/startup scripts
COPY scripts /scripts
RUN bash /scripts/setup/install
RUN rm -fr /scripts/setup

VOLUME ${DB_DIR}
EXPOSE 3306

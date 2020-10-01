#
# Author            Frank,H.L.Lai <frank@leadstec.com>
# Docker Version    19.03
# Website           https://www.leadstec.com
# Copyright         (C) 2020 LEADSTEC Systems. All rights reserved.
#
ARG arch=
FROM leadstec.tencentcloudcr.com/leadstec/alpine${arch}:3.12.0
ARG version=10.4.13
ARG build=dev

LABEL version="${version}-${build}" \
    description="MariaDB image for VCubi platform" \
    maintainer="Frank,H.L.Lai <frank@leadstec.com>"

# set environment variables
ENV MARIADB_VERSION="${version}" \
    MARIADB_LOG_DIR="${LOG_DIR}/mariadb"

# Install packages
RUN apk --update add mariadb mariadb-client && \
    rm /var/cache/apk/*

# add install/startup scripts
COPY scripts /scripts
RUN bash /scripts/setup/install
RUN rm -fr /scripts/setup

VOLUME ${DB_DIR}
EXPOSE 3306

#
# AUTHOR            Frank,H.L.Lai <frank@leadstec.com>
# DOCKER-VERSION    19.03
# Copyright         (C) 2020 LEADSTEC Solutions. All rights reserved.
#
ARG arch=
FROM leadstec/alpine${arch}:3.10.3

ARG version=10.3.x
ARG build=dev

LABEL version="${version}-${build}" \
    description="MariaDB image for VCubi" \
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

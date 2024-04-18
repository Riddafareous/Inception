FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y mariadb-server

# https://mariadb.com/kb/en/starting-and-stopping-mariadb-automatically/
CMD [ "mysqld_safe" ]
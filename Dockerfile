FROM mysql:8.4.9
EXPOSE 3306
ENV MYSQL_ROOT_PASSWORD=admin123
COPY first.sql /docker-entrypoint-initdb.d/

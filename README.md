# MySQL Docker Practice

This repository contains my hands-on practice with running MySQL using Docker, Docker images, containers, volumes, and database initialization.

## Commands

### 1. Create Docker Image

```bash
docker build -t mysql:v1 .
```

### 2. Create a Docker Volume

```bash
docker volume create dbvolume
```

### 3. Create MySQL Container and Mount Volume

```bash
docker run -d \
  --name cont1 \
  -p 3306:3306 \
  -v dbvolume:/var/lib/mysql \
  mysql:v1
```

### 4. Create Another Container Using the Same Volume

```bash
docker run -d \
  --name cont2 \
  -p 3307:3306 \
  -v dbvolume:/var/lib/mysql \
  mysql:v1
```

> **Note:** Mounting the same MySQL data directory to multiple MySQL server containers causes a file-lock conflict such as `Unable to lock ./ibdata1`.

### 5. Connect to MySQL

```bash
docker exec -it cont1 mysql -u root -p
```

### 6. Insert Data

```sql
USE companydb;

INSERT INTO employees (name, email, department, salary)
VALUES ('Devi', 'devi@example.com', 'IT', 80000.00);
```

### 7. Verify Data in `cont1`

```sql
SELECT * FROM employees;
```

### 8. Stop `cont1` Before Starting MySQL in `cont2`

To avoid the MySQL file-lock conflict:

```bash
docker stop cont1
```

### 9. Verify Data in `cont2`

```bash
docker exec -it cont2 mysql -u root -p
```

```sql
USE companydb;

SELECT * FROM employees;
```

The SQL initialization file contains 3 employees initially. After inserting `Devi` from `cont1`, the same 4 rows are visible through `cont2` because both containers are using the same volume.

## Weekend Task

I used this project to complete one of my weekend tasks:

1. Write a Dockerfile for Database (MySQL)
2. Create an Image
3. Create a Volume for database
4. Create a container for database and mount the volume at `/var/lib/mysql`
5. Mount the volume to multiple containers (2–4)
6. Insert data into the database and verify whether the data is replicated across the other containers

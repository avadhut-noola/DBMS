# Database Management System Lab Programs
This repository contains SQL programs for DBMS lab, covering DDL, DML, Views, Triggers, Procedures, Cursors, and more.

Before executing SQL check, MySQL is present on system
```bash
mysql --version
```
If installed, you'll see the version something like:
```bash
mysql  Ver 8.0.35-0ubuntu0.22.04.1 for Linux on x86_64
```

## Installation
To install MySQL if not present, enter following commands.
#### For Ubuntu/Debian:
```bash
sudo apt update 
sudo apt install mysql-server 
sudo systemctl start mysql.service
sudo mysql_secure_installation
```
## Start MySQL command line
```bash
sudo mysql 
```
Login with correct credentials.
You can now execute SQL in the terminal.

# Important tip
Before running queries, make sure to select your database:
``` USE your_database_name; ```

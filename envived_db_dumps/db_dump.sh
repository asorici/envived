#!/bin/bash

if [ $# -lt 4 ]
then
    echo "Error in $0 - not enough arguments supplied. Usage: $0 dump|restore <DB_NAME> <DB_USER> <DB_PASS> [db_file_name]"
exit 1
fi

DB_NAME=$2
DB_USER=$3
DB_PASS=$4

if [ "$1" == "dump" ]
then
    filename="envived_dump_"$(date +%Y_%m_%d_%H_%M_%S)".sql"
    mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $filename
else
    if [ "$1" == "restore" -a $# -eq 5 ]
    then
        mysql -u $DB_USER -p$DB_PASS $DB_NAME < $5
    else
        echo "Error in $0 - wrong arguments supplied. Usage: $0 restore <DB_NAME> <DB_USER> <DB_PASS> <db_file_name>"
    fi
fi

#!/bin/bash

#set -x
set -e
set -u

declare databases
declare users
declare passwords

findDatabaseNames()
{
    i=0
    for db in $(echo $PSQL_DATABASES | tr ',' ' '); do
		databases[i++]="$db"
	done
}

findUserNames()
{
    i=0
    for user in $(echo $PSQL_USERS | tr ',' ' '); do
		users[i++]="$user"
	done
}

findPasswords()
{
    i=0
    for pw in $(echo $PSQL_PASSWORDS | tr ',' ' '); do
		passwords[i++]="$pw"
	done
}

if [ -n "$PSQL_DATABASES" ] && [ -n "$PSQL_USERS" ] && [ -n "$PSQL_PASSWORDS" ]; then

    findDatabaseNames
    findUserNames
    findPasswords

    if [ ${#databases[@]} == ${#users[@]} ] && [ ${#databases[@]} == ${#passwords[@]} ]; then

        for ((i=0; i<${#databases[@]}; i++)); do
            echo "Creating database '${databases[i]}' for user '${users[i]}'"
            psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
                CREATE USER ${users[i]};
                ALTER USER ${users[i]} WITH ENCRYPTED PASSWORD '${passwords[i]}';
                CREATE DATABASE ${databases[i]} WITH OWNER=${users[i]};
                GRANT ALL PRIVILEGES ON DATABASE ${databases[i]} TO ${users[i]};
EOSQL
        done
    else
        echo "All three variables PSQL_DATABASES, PSQL_USERS and PSQL_PASSWORDS must define the same amount of values."
    fi
fi



# many thanks to: http://linuxcommand.org/wss0130.php
#!/usr/bin/env bash

# functions to use
function usage
{
    echo "usage: ./reinit_db.sh [[[-d --database <name>] [-h --host <hostname>]] | [--help]]"
}

# set some default values
db_name=
db_user=axelyoshimoto
host=localhost

# as long as there are any arguments provided, loop through them
while [ "$1" != "" ]; do
  case $1 in
    -d | --database ) shift
                      db_name=$1
                      ;;
    -h | --host )     shift
                      host=$1
                      ;;
    --help )          usage
                      exit
                      ;;
    * )               usage
                      exit
                      ;;
  esac
  # shift: discards first element of arguments array
  shift
done

# if value is not set
if [ "$db_name" == "" ]; then
  echo "No database name provided, exiting program"
  usage
  exit 1
fi

response=
echo -n "Continue re-initializing db [$db_name]? > "
read response

if [ "$response" != "y" ]; then
  echo "Exiting program"
  exit 1
fi

psql -h $host -U $db_user $db_name -c 'DROP SCHEMA public CASCADE;'
echo "dropped schema, continueing with restore"
pg_restore -w -j 2 -h $host -U $db_user --clean --if-exists --no-owner --no-privileges -d $db_name ~/Downloads/prod_19_04_2017.dump
echo "restore completed"

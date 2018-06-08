function usage
{
  echo "works best with review or dev"
}

postfix=""

if [ "$1" != "" ]; then
  postfix=$1
fi

if [ $postfix != "dev" ] && [ $postfix != "review" ]; then
  usage
  exit 1
fi

if [ $postfix == "dev" ]; then
  postfix="test"
fi

if [ $postfix == "review" ]; then
  postfix="review_test"
fi

for i in {1..8}
do
  db_name="acm_"

  if [ $i == 1 ]; then
    db_name=$db_name$postfix
  else
    db_name=$db_name$postfix$i
  fi

  echo $db_name

  psql -h localhost -U postgres -d postgres -c "DROP DATABASE $db_name;"
  psql -h localhost -U postgres -d postgres -c "CREATE DATABASE $db_name;"
  psql -h localhost -U postgres -d $db_name -a -f db/structure.sql
done
# psql -d acm_test  -a -f db/structure.sql
# psql -d acm_test2 -a -f db/structure.sql
# psql -d acm_test3 -a -f db/structure.sql
# psql -d acm_test4 -a -f db/structure.sql
# psql -d acm_test5 -a -f db/structure.sql
# psql -d acm_test6 -a -f db/structure.sql
# psql -d acm_test7 -a -f db/structure.sql
# psql -d acm_test8 -a -f db/structure.sql

# psql -d acm_review_test  -a -f db/structure.sql
# psql -d acm_review_test2 -a -f db/structure.sql
# psql -d acm_review_test3 -a -f db/structure.sql
# psql -d acm_review_test4 -a -f db/structure.sql
# psql -d acm_review_test5 -a -f db/structure.sql
# psql -d acm_review_test6 -a -f db/structure.sql
# psql -d acm_review_test7 -a -f db/structure.sql
# psql -d acm_review_test8 -a -f db/structure.sql

echo '#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT=$($PSQL "SELECT atomic_number, name, symbol FROM elements WHERE atomic_number=$1 OR symbol='\$1' OR name='\$1'")
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo $ELEMENT | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL
    do
      echo "The element with atomic number \$ATOMIC_NUMBER is \$NAME (\$SYMBOL)."
    done
  fi
fi' > element.sh

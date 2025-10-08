#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if argument is empty
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  #detect if number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #get data with atomic number
    DATA_ELEMENT=$($PSQL "SELECT atomic_number,symbol,name FROM elements WHERE atomic_number=$1")
  # detect if start with uppercase and less than 2 characters
  elif [[ $1 =~ ^[A-Z] ]] && [[ ${#1} -le 2 ]]
  then
    #get data with symbol
    DATA_ELEMENT=$($PSQL "SELECT atomic_number,symbol,name FROM elements WHERE symbol='$1'")
  # detect if start with uppercase
  elif [[ $1 =~ ^[A-Z] ]]
  then
    #get data with name
    DATA_ELEMENT=$($PSQL "SELECT atomic_number,symbol,name FROM elements WHERE name='$1'")
  fi
  #see if we got no data
  if [[ -z "$DATA_ELEMENT" ]]
  then
    echo "I could not find that element in the database."
  else
    #create each argument of element data
    IFS='|' read ATOMIC_NUMBER SYMBOL NAME <<< "$DATA_ELEMENT"
    #obtain data from properties
    DATA_PROPERTIES=$($PSQL "SELECT atomic_mass,melting_point_celsius,boiling_point_celsius,type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    #create each argument of properties data
    IFS='|' read ATOMIC_MASS MELTING BOILING TYPE_ID <<< "$DATA_PROPERTIES"
    #obtain type
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
    # write the output
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi

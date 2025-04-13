if [[ -z $* ]]
then
  # no args passed
  echo "Please provide an element as an argument."
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

  if [[ ($1 =~ ^[0-9]+$) ]]
  then
    # user passed in a number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  else
    # user passed in a symbol or name
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
  fi

  if [[ -z $ATOMIC_NUMBER ]]
  then
    # element not found
    echo "I could not find that element in the database."
  else
    # get all values needed
    ELEMENT_INFO=$($PSQL "SELECT symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM properties LEFT JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON types.type_id = properties.type_id WHERE properties.atomic_number = $ATOMIC_NUMBER")

    # read values into single vars for easier printing
    # thanks https://bashcommands.com/bash-read-lines-into-multiple-variables for method on reading string into vars
    IFS="|"
    read SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE <<< $ELEMENT_INFO

    # print output to user
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  fi
fi
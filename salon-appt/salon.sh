#!/bin/bash

MAKE_APPOINTMENT() {
  # get user's phone number, make sure they entered something
  while [[ -z $CUSTOMER_PHONE ]]
  do
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
  done

  # check if user is already a customer
  CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # here, user is not a customer, need to add them
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get user's name
    while [[ -z $CUSTOMER_NAME ]]
    do
      echo -e "\nI don't have a record for you, what's your name?"
      read CUSTOMER_NAME
    done

    # Insert them in
    INSERT_CUSTOMER=$(psql --username=freecodecamp --dbname=salon -t -c "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi

  # get time
  while [[ -z $SERVICE_TIME ]]
  do
    echo -e "\nWhat time would you like your appointment, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
  done

  # get customer id for appointment
  CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # make record for appointment
  INSERT_APPOINTMENT=$(psql --username=freecodecamp --dbname=salon -t -c "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $1, '$SERVICE_TIME')")

  # need service name for output
  SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # final output msg
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU() {
  # check if status/error msg was passed, display it
  if [[ $1 ]]
  then
    echo -e "$1\n"
  fi
  
  # welcome msg
  echo "Welcome to the salon! Here's the services we offer: "

  # get service options, display to user
  SERVICE_OPTIONS=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT service_id, name FROM services")
  echo "$SERVICE_OPTIONS" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # get user choice for service
  echo -e "\nPlease enter your choice: "
  read SERVICE_ID_SELECTED

  # check user input
  # make sure user entered valid number
  if [[ !($SERVICE_ID_SELECTED =~ ^[0-9]+$) ]]
  then
    MAIN_MENU "Please enter a number corresponding to a service we offer!"
  else
    SERVICE_ID_SELECTED=$(psql --username=freecodecamp --dbname=salon -t -c "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    # make sure user entered valid service
    if [[ -z $SERVICE_ID_SELECTED ]]
    then
      MAIN_MENU "We couldn't find that service!"
    else
      MAKE_APPOINTMENT $SERVICE_ID_SELECTED
    fi
  fi
}

MAIN_MENU
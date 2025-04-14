#!/bin/bash

# PSQL var for querying database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generates a random number between 1 and 1000
# thanks https://stackoverflow.com/questions/1194882/how-to-generate-random-number-in-bash for generating random numbers
RANDOM_NUMBER=$((1 + $RANDOM % 1000))

# prompt user for username
while [[ -z $USERNAME || ${#USERNAME} > 22 ]]; do
  echo "Enter your username: "
  read USERNAME
done

# see if username is found
USER_ID=$($PSQL "SELECT user_id FROM user_info WHERE username = '$USERNAME'")

# if not found, then insert username, welcome user
if [[ -z $USER_ID ]]
then
  INSERT_USER=$($PSQL "INSERT INTO user_info(username) VALUES('$USERNAME')")

  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # get user information, print to user
  USER_INFO=$($PSQL "SELECT games_played, lowest_guesses FROM user_info WHERE username = '$USERNAME'")
  # IFS needs to be backed up for later commands to work
  # thanks https://unix.stackexchange.com/questions/640062/how-to-temporarily-save-and-restore-the-ifs-variable-properly for backing up IFS
  oldIFS=$IFS
  IFS='|'
  read GAMES_PLAYED LOWEST_GUESSES <<< $USER_INFO
  IFS=$oldIFS

  # check if user actually played games (this can happen if user exits script during gameplay)
  if [[ -z $GAMES_PLAYED || -z $LOWEST_GUESSES ]]
  then
    echo "Welcome back, $USERNAME! You have played no games!"
  else
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $LOWEST_GUESSES guesses."
  fi
fi

# main gameplay
if [[ -n $USERNAME ]]
then
  # store num of guesses
  NUM_GUESSES=1

  # initial prompt
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  # see if user got it right
  while [[ $GUESS != $RANDOM_NUMBER ]]; do
    if [[ !($GUESS =~ ^[0-9]+$) ]]
    then
      echo "That is not an integer, guess again:"
    elif [[ $GUESS > $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi

    # thanks https://linuxsimply.com/bash-scripting-tutorial/variables/usage/add-1-to-variable/ for adding 1 to var
    (( NUM_GUESSES+=1 ))

    read GUESS
  done

  # user got it
  echo "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

  # update info in database
  # first get old info
  USER_INFO=$($PSQL "SELECT games_played, lowest_guesses FROM user_info WHERE username = '$USERNAME'")
  oldIFS=$IFS
  IFS='|'
  read GAMES_PLAYED LOWEST_GUESSES <<< $USER_INFO
  IFS=$oldIFS

  # update info from current game
  if [[ -z $LOWEST_GUESSES || $NUM_GUESSES < $LOWEST_GUESSES ]]
  then
    LOWEST_GUESSES=$NUM_GUESSES
  fi
  if [[ -z $GAMES_PLAYED ]]
  then
    GAMES_PLAYED=1
  else
    (( GAMES_PLAYED+=1 ))
  fi

  # finally update in database
  UPDATE_INFO=$($PSQL "UPDATE user_info SET games_played = $GAMES_PLAYED, lowest_guesses = $LOWEST_GUESSES WHERE username = '$USERNAME'")
fi
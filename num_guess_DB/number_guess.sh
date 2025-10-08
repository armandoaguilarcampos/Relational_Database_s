#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1001 ))

#get username
echo "Enter your username:"
read USERNAME
#get username_id
USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE username='$USERNAME'")
#if username doesn't exist
if [[ -z $USERNAME_ID ]]
then
  #insert new username
  INSERT_USERNAME=$($PSQL "INSERT INTO usernames(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here." 
else
  #show username data
  OLD_DATA=$($PSQL "SELECT games_played,best_game FROM usernames WHERE username_id=$USERNAME_ID")
  IFS='|' read GAMES_PLAYED BEST_GAME <<< "$OLD_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
#get username_id
USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE username='$USERNAME'")
echo "Guess the secret number between 1 and 1000:"
#until secret number guessed, continue
NUMBER_OF_GUESSES=0
while [[ $GUESS -ne $SECRET_NUMBER ]]
do
  read GUESS
  # keep reading guess if not number
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done
  #give clues to user
  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi
   ((NUMBER_OF_GUESSES++))
done
#get old user data
OLD_DATA=$($PSQL "SELECT games_played,best_game FROM usernames WHERE username_id=$USERNAME_ID")
IFS='|' read OLD_GAMES_PLAYED OLD_BEST_GAME <<< "$OLD_DATA"
#if no number in data
if [[ -z $OLD_GAMES_PLAYED ]]
then
  #save data in database
  NEW_DATA=$($PSQL "UPDATE usernames SET games_played=1,best_game=$NUMBER_OF_GUESSES WHERE username_id=$USERNAME_ID")
else
  #new number of games played
  NEW_GAMES_PLAYED=$((1 + OLD_GAMES_PLAYED))
  GAMES_PLAYED_UPDATED=$($PSQL "UPDATE usernames SET games_played=$NEW_GAMES_PLAYED WHERE username_id=$USERNAME_ID")
  #best game updated if new counter lower than old counter
  if [[ $NUMBER_OF_GUESSES -lt $OLD_GAMES_PLAYED ]]
  then
    NEW_BEST_GAME=$($PSQL "UPDATE usernames SET best_game=$NUMBER_OF_GUESSES WHERE username_id=$USERNAME_ID")
  fi
fi
#show end results
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
#!/bin/bash

# Display ASCII Art Banner
echo '
 ____                                     _ 
|  _ \ __ _ ___ _____      _____  _ __ __| |
| |_) / _` / __/ __\ \ /\ / / _ \| `__/ _` |
|  __/ (_| \__ \__ \\ V  V / (_) | | | (_| |
|_|   \__,_|___/___/ \_/\_/ \___/|_|  \__,_|
  ____                           _           
 / ___| ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
| |  _ / _ \ `_ \ / _ \ `__/ _` | __/ _ \| `__|
| |_| |  __/ | | |  __/ | | (_| | || (_) | |   
 \____|\___|_| |_|\___|_|  \__,_|\__\___/|_|   
=================================================
'

# Function to check if figlet is installed
check_figlet() {
    if ! command -v figlet &> /dev/null
    then
        echo "figlet is not installed. Please install it first:"
        echo "On Debian/Ubuntu: sudo apt-get install figlet"
        echo "On macOS: brew install figlet"
        exit 1
    fi
}

# Function to generate a random password
generate_password() {
    local length=$1
    # Define character sets
    local lowercase="abcdefghijklmnopqrstuvwxyz"
    local uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local numbers="0123456789"
    local special="!@#$%^&*()_+-=[]{}|;:,.<>?"
    local all=$lowercase$uppercase$numbers$special
    
    # Ensure at least one character from each set
    password=$(echo ${lowercase} | fold -w1 | shuf | head -c1)
    password+=$(echo ${uppercase} | fold -w1 | shuf | head -c1)
    password+=$(echo ${numbers} | fold -w1 | shuf | head -c1)
    password+=$(echo ${special} | fold -w1 | shuf | head -c1)
    
    # Fill the rest with random characters
    for ((i=4; i<length; i++))
    do
        password+=$(echo ${all} | fold -w1 | shuf | head -c1)
    done
    
    # Shuffle the password
    echo $password | fold -w1 | shuf | tr -d '\n'
}

# Main script
clear
check_figlet

# Get password length from user or use default
echo "Enter desired password length (minimum 8, default 12):"
read length

# Validate input
if [[ ! $length =~ ^[0-9]+$ ]] || [ $length -lt 8 ]
then
    length=12
    echo "Using default length: 12"
fi

# Generate and display password
password=$(generate_password $length)
echo -e "\nYour generated password is:"
echo $password | figlet -f standard
echo -e "\nPlain text version: $password"
echo -e "\nPassword length: ${#password} characters"

# Optional: Copy to clipboard based on OS
if [ "$(uname)" == "Darwin" ]
then
    echo $password | pbcopy
    echo "Password copied to clipboard!"
elif [ -x "$(command -v xclip)" ]
then
    echo $password | xclip -selection clipboard
    echo "Password copied to clipboard!"
else
    echo "Note: Install xclip (Linux) to enable clipboard functionality"
fi

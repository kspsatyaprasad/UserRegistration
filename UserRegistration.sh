#!/bin/bash
while [[ True ]]
do
    echo "Choose any of the options below for validating your details:"
    echo "To enter first name select option 1 "
    echo "To enter last name select option 2"
    echo "To exit select option 6"
    read -p "enter your option:" option

    case $option in
        1 | 2)
            #it should start with capital letter and
            #has minimum 3 characters
            pattern_check="^[A-Z][a-zA-Z]{2,}$"
            ;;
        5)
            echo "exiting......"
            exit
            ;;
        *)
            echo 'Invalid entry.enter valid option'
            ;;
    esac

    if [[ $option =~ ^[12]$ ]]
    then
        read -p "enter your input:" pattern_to_be_checked
        if [[ $pattern_to_be_checked =~ $pattern_check ]]
        then
            echo "$pattern_to_be_checked is valid"
        else
            echo "$pattern_to_be_checked is not valid"
        fi
    fi

done

#!/bin/bash
while [[ True ]]
do
    echo "Choose any of the options below for validating your details:"
    echo "To enter first name select option 1 "
    echo "To enter last name select option 2"
    echo "To enter email select option 3"
    echo "To exit select option 6"
    read -p "enter your option:" option

    case $option in
        1 | 2)
            #it should start with capital letter and
            #has minimum 3 characters
            pattern_check="^[A-Z][a-zA-Z]{2,}$"
            ;;
        3)
            #abc.xyz@bl.co.in
            #email has 3 mandatory parts(abc,bl&co) and 2 optional
            #(xyz & in ) with precise @ and . postions
            pattern_check="^[a-z]{3,}(.[a-z]*)?@([a-z]){2,}.[a-z]+(.in)*"
            ;;
        5)
            echo "exiting......"
            exit
            ;;
        *)
            echo 'Invalid entry.enter valid option'
            ;;
    esac

    if [[ $option =~ ^[123]$ ]]
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

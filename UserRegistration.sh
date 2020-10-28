#!/bin/bash
while [[ True ]]
do
    echo "Choose any of the options below for validating your details:"
    echo "To enter first name select option 1 "
    echo "To enter last name select option 2"
    echo "To enter email select option 3"
    echo "To enter phone number select option 4"
    echo "To enter password select option 5"
    echo "To exit select option 6"
    read -p "enter your option:" option
    read -p "enter your input:" pattern_to_be_checked

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
        4)
            #phonenumber have country code and 10
            #digits with space seperated
            #country code can have 1 to 6 digits
            pattern_check="^[0-9]{1,6}\s[0-9]{10}$"
            ;;
        5)
            #password minimum lenth 8
            #atleast have 1 uppercase
            #atlest have 1 numbers
            pattern_check="(?=.*[A-Z])(?=.*[0-9]).{8,}"
            #since =~ doesn't support lookheads
            #grep is used with -P for perl
            #regex engine
            result=$(echo $pattern_to_be_checked | grep -P $pattern_check)
            if [ -z "${result}" ]
            then
                echo "$pattern_to_be_checked is not valid password";
            else
                echo "$pattern_to_be_checked is valid password";
            fi
            ;;
        6)
            echo "exiting......"
            exit 2
            ;;
        *)
            echo 'Invalid entry.enter valid option'
            ;;
    esac

    if [[ $option =~ ^[1234]$ ]]
    then

        if [[ $pattern_to_be_checked =~ $pattern_check ]]
        then
            echo "$pattern_to_be_checked is valid"
        else
            echo "$pattern_to_be_checked is not valid"
        fi
    fi

done 

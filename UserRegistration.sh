#!/bin/bash
while [[ True ]]
do
    echo "Choose any of the options below for validating your details:"
    echo "To enter first name select option 1"
    echo "To enter last name select option 2"
    echo "To enter email select option 3"
    echo "To enter phone number select option 4"
    echo "To enter password select option 5"
    echo "To exit select option 6"
    read -p "enter your option:" option
    read -p "enter your input:" pattern_to_be_checked

    case $option in
        1 | 2)
		    #following conditions should be satisfied
            #it should start with capital letter and
            #it should have minimum 3 characters
            pattern_check="^[A-Z][a-zA-Z]{2,}$"
            echo -n "Entered name "
            ;;
        3)
            #following conditions should be satisfied
            #email has 3 mandatory parts(abc,bl&co) and 2 optional
            #(xyz & in ) with precise @ and . postions
            pattern_check="^[a-zA-Z0-9]+([._+-][a-zA-Z0-9]+)*@[0-9a-zA-Z]+.[a-zA-Z]{2,4}+([.][a-zA-Z]{2,3})?$"
            echo -n "Entered email "
            ;;
        4)
            #following conditions should be satisfied
			#phonenumber have country code and 10
            #digits with space seperated
            #country code can have 1 to 6 digits
            pattern_check="^[0-9]{1,6}\s[0-9]{10}$"
            echo -n "Entered phone number "
            ;;
        5)
            #following conditions should be satisfied
			#password minimum lenth 8
            #atleast have 1 uppercase letter
            #atleast have 1 number
            #should have 1 special symbol
            pattern_check="(?=.*[A-Z])(?=.*[0-9])(?=.*[*.!@$%^&(){}[\]:;<>,.?\/~_+\-=|#]).{8,}"
            echo -n "Entered password "
            ;;
        6)
            echo "exiting......"
            exit 2
            ;;
        *)
            echo "Invalid entry.enter valid option"
            ;;
    esac

    if [[ $option =~ ^[12345]$ ]]
    then
            #=~ is not supporting lookheads so grep is used along with -P
            resulting_pattern=$(echo $pattern_to_be_checked | grep -P $pattern_check)
            if [ -z "${resulting_pattern}" ]
            then
                echo "$pattern_to_be_checked is not valid";
            else
                echo "$pattern_to_be_checked is valid";
            fi
    fi

done 

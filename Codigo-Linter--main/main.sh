#!/usr/bin/env bash
green='\033[0;31m'                                                                                                                                        

banner()
    {
        echo " 
         __   __   __     __   __                 ___  ___  __  
        /  ` /  \ |  \ | / _` /  \    |    | |\ |  |  |__  |__) 
        \__, \__/ |__/ | \__> \__/    |___ | | \|  |  |___ |  \ 
                                                        
                                                        "
    }

border()
    {
        echo "<==========================================================================================================================================================>"
        echo "<==========================================================================================================================================================>"
        sleep 0.05s
        echo "                                                                                                                                                            "
        sleep 0.05s
    }

Check_For_Syntax_Error()
    {
        read -p "Enter the name of the shell script file: " FILE_NAM
        export FILE_NAAM=$FILE_NAM
        FILE_NAME=$(sed '/^#/d' "$FILE_NAM")
        export FILE=$FILE_NAME
        # pcre limit
        # SecPcreMatchLimit 250000
        # SecPcreMatchLimitRecursion 250000
        # Check if the file exists
        # echo $FILE

        if [ -n "$FILE" ]; then
        
        # Check the syntax of the shell script
        echo "started matching"
        # echo "$FILE"

        else

        # If the file does not exist, print an error message
        echo "File not found: $FILE"

        fi

        # ./check_quotes.sh $FILE
        #working checks
        ./for.sh
        ./if.sh
        ./while.sh
        ./check_case_conditional.sh
        ./check_quotes.sh
        #not working checks


        # echo $FILE
        # ./check_quotes.sh

        # ./p1.sh
        # ./forv2.sh
        # ./ifv2.sh
    }

Choice()
    {
        echo "                                                                                                                                                            "

        echo "1. Check For Syntax Error: "
        echo "2. Exit "

        echo "                                                                                                                                                            "

        read -p "Enter the choice: " choice

        sleep 0.05s
        echo "
                                                                                                                                                                    "
        border

        if [ $choice = "1" ]
then
    
    Check_For_Syntax_Error
    again

else    
  
    echo "Do you what to Check another File"
    echo "byee byee"  
    exit 1

fi
    }

again()    
    {
        read -p "Do you what to Check another File (yes/no): " yn
        echo ""
        
        if [[ $yn = "yes" || $yn = "y" || $yn = "Yes" || $yn = "Y" ]] 
        then
        
            condi= true
        
        else

            condi= false
            echo "$condi"
            echo "Do you what to Check another File"
            echo "byee byee"  
            exit 1

        fi
        
        while $condi 
        do
        
            border
            Choice
            Check_For_Syntax_Error
        
        done
    }

banner

border

Choice


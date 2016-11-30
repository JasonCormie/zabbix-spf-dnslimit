#!/bin/bash

getspf() {
                  dig $1 txt | grep "^$1" | grep v=spf1 | tr -d '"' | sed 's/^.*v=spf1/v=spf1/' | tr ' ' '\n' | while read line; do
                 
                        if [[ $line =~ ^ptr ]]; then
                                echo $line 
                        #elif [[ $line =~ ^ip4 ]]; then
                        #        echo $line 
                        #elif [[ $line =~ ^ip6 ]]; then
                        #        echo $line 
                        elif [[ $line =~ ^a$ ]]; then
                                echo $line 
                        elif [[ $line =~ ^mx$ ]]; then
                                echo $line 
                        elif [[ $line =~ ^a ]]; then
                                echo $line 
                        elif [[ $line =~ ^mx ]]; then
                                echo $line 
                        elif [[ $line =~ ^include ]]; then
                                echo $line
                                getspf $(echo $line | sed 's/^include://g')
                        elif [[ $line =~ ^redirect ]]; then
                                echo $line 
                                getspf $(echo $line | sed 's/^redirect=//g')
                        else
                                continue
                        fi
                    done
}

if [ -z $1 ]; then
  echo "getspf <domain>"
else
  echo `getspf $1 | wc -l`

fi

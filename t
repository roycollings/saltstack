#!/usr/bin/env bash
grep "-" states/top.sls | awk '{print $NF}' | while read x
do
    printf "\n\n-------------------------------------------\n\n"
    
    sudo salt-call --local --file-root=./states state.sls $x
done

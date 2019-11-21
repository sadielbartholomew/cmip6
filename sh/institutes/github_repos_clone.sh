#!/bin/bash

# Main entry point.
main()
{
    mkdir $ESDOC_HOME/repos/institutional
    cd $ESDOC_HOME/repos/institutional

    for institution_id in "${INSTITUTION_ID[@]}"
    do
        git clone https://github.com/ES-DOC-INSTITUTIONAL/$institution_id.git
    done
}

# Invoke entry point.
main

#!/bin/bash

# Main entry point.
main()
{
    mkdir $ESDOC_HOME/repos/institutional
    pushd $ESDOC_HOME/repos/institutional
    for institution_id in "${INSTITUTION_ID[@]}"
    do
        git clone https://github.com/ES-DOC-INSTITUTIONAL/$institution_id.git
    done
    popd -1
}

# Invoke entry point.
main

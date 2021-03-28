#!/usr/bin/env bash

# Main entry point.
main()
{
    mkdir "$CMIP6_HOME"/repos/institutional
    pushd "$CMIP6_HOME"/repos/institutional
    for institution_id in "${CMIP6_INSTITUTION_ID[@]}"
    do
        git clone https://github.com/ES-DOC-INSTITUTIONAL/$institution_id.git
    done
    popd
}

# Invoke entry point.
main

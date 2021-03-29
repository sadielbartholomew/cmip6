#!/usr/bin/env bash

# Main entry point.
main()
{
    local INSTITUTION_ID

    if [ ! -d "$CMIP6_HOME"/repos/institutions ]; then
        mkdir -p "$CMIP6_HOME"/repos/institutions
    fi

    pushd "$CMIP6_HOME"/repos/institutions
    for INSTITUTION_ID in "${CMIP6_INSTITUTION_ID[@]}"
    do
        if [ ! -d "$CMIP6_HOME"/repos/institutions/"$INSTITUTION_ID" ]; then
            git clone https://github.com/ES-DOC-INSTITUTIONAL/"$INSTITUTION_ID".git
        fi
    done
    popd
}

# Invoke entry point.
main

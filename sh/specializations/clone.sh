#!/usr/bin/env bash

# Main entry point.
main()
{
    local SPECIALIZATION

    if [ ! -d "$CMIP6_HOME"/repos/specializations ]; then
        mkdir -p "$CMIP6_HOME"/repos/specializations
    fi

    pushd "$CMIP6_HOME"/repos/specializations
    for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
    do
        if [ ! -d "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION" ]; then
            git clone https://github.com/ES-DOC-INSTITUTIONAL/cmip6-specializations-"$SPECIALIZATION".git
        fi
    done
    popd
}

# Invoke entry point.
main

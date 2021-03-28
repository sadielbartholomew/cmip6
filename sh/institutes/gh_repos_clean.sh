#!/usr/bin/env bash

function main()
{
    local INSTITUTION

	for INSTITUTION in "${CMIP6_INSTITUTION_ID[@]}"
	do
        if [ -d "$CMIP6_HOME"/repos/institutional/"$INSTITUTION" ]; then            
            do_clean "$INSTITUTION"
        else
            log "insititute repo must be created: $INSTITUTION"
        fi
	done
}

function do_clean() {
    local INSTITUTION=${1}
    local REPO="$CMIP6_HOME"/repos/institutional/"$INSTITUTION"

    pushd "$REPO"
    if [ ! -d "$REPO"/cmip6 ]; then            
        mkdir -p "$REPO"/cmip6
    fi
    if [ ! -d "$REPO"/cmip6/citations ]; then            
        mkdir -p "$REPO"/cmip6/citations
    fi
    if [ ! -d "$REPO"/cmip6/machines ]; then            
        mkdir -p "$REPO"/cmip6/machines
    fi
    if [ ! -d "$REPO"/cmip6/models ]; then            
        mkdir -p "$REPO"/cmip6/models
    fi
    if [ ! -d "$REPO"/cmip6/responsible_parties ]; then            
        mkdir -p "$REPO"/cmip6/responsible_parties
    fi
    popd
}

# Invoke entry point.
main

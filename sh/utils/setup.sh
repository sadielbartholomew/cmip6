#!/usr/bin/env bash

# Main entry point.
function _main()
{
    local ARCHIVE
    local INSTITUTION_ID
    local LIB
    local SPECIALIZATION

    log "setting directories"
    mkdir -p "$CMIP6_HOME"/repos

    log "setting repos:"
    log "... archives:"
	for ARCHIVE in "${CMIP6_ARCHIVES[@]}"
	do      
        _set_repo "archives" "$LIB" https://github.com/ES-DOC/"$ARCHIVE".git
	done     
    log "... institutions:"
	for INSTITUTION_ID in "${CMIP6_INSTITUTION_ID[@]}"
	do     
        _set_repo "institutions" "$INSTITUTION_ID" https://github.com/ES-DOC-INSTITUTIONAL/"$INSTITUTION_ID".git
	done    
    log "... libs:"
	for LIB in "${CMIP6_LIBS[@]}"
	do      
        _set_repo "libs" "$LIB" https://github.com/ES-DOC/"$LIB".git
	done       
    log "... specializations:"
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do     
        _set_repo "specializations" cmip6-specializations-"$SPECIALIZATION" https://github.com/ES-DOC/cmip6-specializations-"$SPECIALIZATION".git
	done
}

function _set_repo()
{
    local REPO_TYPE=${1}
    local REPO_NAME=${2}
    local REPO_URL=${3}

    local PATH_TO_REPO_TYPE="$CMIP6_HOME"/repos/"$REPO_TYPE"
    local PATH_TO_REPO="$PATH_TO_REPO_TYPE"/"$REPO_NAME"

    mkdir -p "$PATH_TO_REPO_TYPE"

    if [ -d "$PATH_TO_REPO" ]; then
        log "... ... syncing $REPO_URL"
        pushd "$PATH_TO_REPO" || exit
        git pull > /dev/null 2>&1
        popd || exit
    else
        log "... ... cloning $REPO_URL"
        pushd "$PATH_TO_REPO_TYPE" || exit
        git clone "$REPO_URL" > /dev/null 2>&1
        popd || exit
    fi
}

# Invoke entry point.
_main

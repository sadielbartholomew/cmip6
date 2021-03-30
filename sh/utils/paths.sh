#!/usr/bin/env bash

function get_path_to_repo()
{
    local REPO_TYPE=${1}
    local REPO_NAME=${2}

    echo "$CMIP6_HOME"/repos/"$REPO_TYPE"/"$REPO_NAME"
}

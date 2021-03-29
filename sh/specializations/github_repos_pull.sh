#!/usr/bin/env bash

# Main entry point.
function _main()
{
    local SPECIALIZATION
	local REPO_NAME
	local PATH_TO_REPO
	
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		REPO_NAME=cmip6-specializations-"$SPECIALIZATION"
		PATH_TO_REPO=$(get_path_to_repo "specializations" "$REPO_NAME")
		if [ -d "$PATH_TO_REPO" ]; then
			log "GITHUB : pulling  $SPECIALIZATION"
			pushd "$PATH_TO_REPO" || exit
			git pull > /dev/null 2>&1
			popd || exit
		else
			log "specialization repo needs to be installed: $SPECIALIZATION"
		fi
	done
}

# Invoke entry point.
_main

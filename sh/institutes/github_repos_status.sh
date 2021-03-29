#!/usr/bin/env bash

# Main entry point.
main()
{
    local INSTITUTION_ID

	for INSTITUTION_ID in "${CMIP6_INSTITUTION_ID[@]}"
	do
		if [ -d "$CMIP6_HOME"/repos/institutions/"$INSTITUTION_ID" ]; then
			log "GITHUB : status of  $INSTITUTION_ID:"
			pushd "$CMIP6_HOME"/repos/institutions/"$INSTITUTION_ID"
			git status
			popd
		else
			log "institutional repo needs to be installed: $INSTITUTION_ID"
		fi
	done	
}

# Invoke entry point.
main

#!/usr/bin/env bash

# Main entry point.
main()
{
	for institution_id in "${CMIP6_INSTITUTION_ID[@]}"
	do
		log "GITHUB : pulling  "$institution_id
		pushd "$CMIP6_HOME"/repos/institutional/$institution_id
		git pull
		popd
	done
}

# Invoke entry point.
main

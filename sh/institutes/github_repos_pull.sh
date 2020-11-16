#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTION_ID[@]}"
	do
		log "GITHUB : pulling  "$institution_id
		pushd $ESDOC_HOME/repos/institutional/$institution_id
		git pull
		popd -1
	done
}

# Invoke entry point.
main

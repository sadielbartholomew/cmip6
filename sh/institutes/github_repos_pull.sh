#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTION_ID[@]}"
	do
		log "GITHUB : pulling  "$institution_id
		cd $ESDOC_HOME/repos/institutional/$institution_id
		git pull
	done
}

# Invoke entry point.
main

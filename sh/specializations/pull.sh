#!/bin/bash

# Main entry point.
main()
{
	cd $ESDOC_HOME/repos
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "CMIP6-SPECS : pulling "$specialization
		cd $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization
		git pull
	done
}

# Invoke entry point.
main

#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log_banner
		log "pulling "$specialization
		log_banner
		cd $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization
		git pull
	done
}

# Invoke entry point.
main

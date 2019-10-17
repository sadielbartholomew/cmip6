#!/bin/bash

# Main entry point.
main()
{
	mkdir -p $ESDOC_DIR_CMIP6
	cd $ESDOC_DIR_CMIP6

	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "CMIP6-SPECS : cloning "$specialization
		git clone https://github.com/ES-DOC/cmip6-specializations-$specialization.git
	done
}

# Invoke entry point.
main

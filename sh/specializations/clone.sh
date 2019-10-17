#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-clone"

	mkdir -p $ESDOC_DIR_CMIP6
	cd $ESDOC_DIR_CMIP6

	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "CMIP6-SPECS : cloning "$specialization
		git clone https://github.com/ES-DOC/cmip6-specializations-$specialization.git
	done

	on_cmd_end "specializations-clone"
}

# Invoke entry point.
main

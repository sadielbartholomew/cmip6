#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-pull"

	cd $ESDOC_HOME/repos
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "CMIP6-SPECS : pulling "$specialization
		cd $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization
		git pull
	done

	on_cmd_end "specializations-pull"
}

# Invoke entry point.
main

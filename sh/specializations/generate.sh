#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-generate"

	if [ "$1" ]; then
		declare specialization=$1
		log_banner
		log "CMIP6-SPECS : generating "$specialization
		log_banner
		python $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/generate
	else
		for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			log_banner
			log "CMIP6-SPECS : generating "$specialization
			log_banner
			python $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/generate
		done
	fi

	on_cmd_end "specializations-generate"
}

# Invoke entry point.
main $1

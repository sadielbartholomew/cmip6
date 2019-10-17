#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-validate"

	if [ "$1" ]; then
		declare specialization=$1
		python $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/validate
	else
		for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			python $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/validate
		done
	fi

	on_cmd_end "specializations-validate"
}

# Invoke entry point.
main $1

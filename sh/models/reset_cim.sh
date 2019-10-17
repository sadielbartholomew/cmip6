#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "models-reset-cim"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/models/reset_cim.py --institution-id=$institution

	on_cmd_end "models-reset-cim"
}

# Invoke entry point.
main $1

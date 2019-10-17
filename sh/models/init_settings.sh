#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "models-init-settings"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/models/init_settings.py --institution-id=$institution

	on_cmd_end "models-init-settings"
}

# Invoke entry point.
main $1
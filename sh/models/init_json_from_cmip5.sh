#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "models-init-json-from-cmip5"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/models/init_json_from_cmip5 --institution-id=$institution

	on_cmd_end "models-init-json-from-cmip5"
}

# Invoke entry point.
main $1
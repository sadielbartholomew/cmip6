#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "models-generate-json"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/models/generate_json.py --institution-id=$institution

	on_cmd_end "models-generate-json"
}

# Invoke entry point.
main $1
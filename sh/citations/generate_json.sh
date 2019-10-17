#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "citations-generate-json"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi
	python $CMIP6_LIB/citations/generate_json.py --institution-id=$institution

	on_cmd_end "citations-generate-json"
}

# Invoke entry point.
main $1

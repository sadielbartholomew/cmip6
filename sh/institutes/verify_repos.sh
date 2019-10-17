#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin 'verify-repos'

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/institutes/verify_repos.py --institution-id=$institution

	on_cmd_end 'verify-repos'
}

# Invoke entry point.
main $1
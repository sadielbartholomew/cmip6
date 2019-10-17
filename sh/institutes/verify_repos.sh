#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/institutes/verify_repos.py --institution-id=$1
}

# Invoke entry point.
main $1
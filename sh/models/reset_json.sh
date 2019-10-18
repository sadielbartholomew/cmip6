#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CMIP6_LIB/models/reset_json.py --institution-id=$institution
}

# Invoke entry point.
main $1

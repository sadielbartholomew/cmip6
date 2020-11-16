#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	pipenv run python $CMIP6_LIB/models/init_xls_coupling --institution-id=$institution
}

# Invoke entry point.
main $1

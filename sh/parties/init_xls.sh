#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	xls_template=$CMIP6_LIB/parties/templates/parties.xlsx

	pipenv run python $CMIP6_LIB/parties/init_xls.py --institution-id=$institution --xls-template=$xls_template
}

# Invoke entry point.
main $1

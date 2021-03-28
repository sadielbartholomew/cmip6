#!/usr/bin/env bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	xls_template=$CMIP6_HOME/lib/citations/templates/citations.xlsx

	pipenv run python "$CMIP6_HOME"/lib/citations/init_xls.py --institution-id=$institution --xls-template=$xls_template
}

# Invoke entry point.
main $1

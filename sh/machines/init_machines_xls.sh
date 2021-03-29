#!/usr/bin/env bash

# Main entry point.
function _main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	xls_template=$CMIP6_HOME/lib/machines/templates/machines.xlsx

	pipenv run python "$CMIP6_HOME"/lib/machines/init_xls.py --institution-id=$institution --xls-template=$xls_template
}

# Invoke entry point.
_main "$1"

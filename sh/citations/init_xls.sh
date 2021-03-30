#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION
	local XLS_TEMPLATE

	if [ "$1" ]; then
		INSTITUTION=$1
	else
		INSTITUTION=all
	fi

	XLS_TEMPLATE=$CMIP6_HOME/lib/citations/templates/citations.xlsx

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/citations/init_xls.py --institution-id="$INSTITUTION" --xls-template="$XLS_TEMPLATE"
	popd || exit
}

# Invoke entry point.
_main "$1"

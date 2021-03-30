#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION
	local PATH_TO_XLS_TEMPLATE

	if [ "$1" ]; then
		INSTITUTION=${1}
	else
		INSTITUTION="all"
	fi

	PATH_TO_XLS_TEMPLATE="$CMIP6_HOME"/lib/parties/templates/parties.xlsx

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/parties/init_xls.py --institution-id="$INSTITUTION" --xls-template="$PATH_TO_XLS_TEMPLATE"
	popd || exit
}

# Invoke entry point.
_main "$1"

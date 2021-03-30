#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION

	if [ "$1" ]; then
		INSTITUTION=${1}
	else
		INSTITUTION="all"
	fi

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/models/generate_xls --institution-id="$INSTITUTION"
	popd || exit
}

# Invoke entry point.
_main "$1"

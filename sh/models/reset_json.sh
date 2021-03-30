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
	pipenv run python "$CMIP6_HOME"/lib/models/reset_json.py --institution-id="$INSTITUTION"
}

# Invoke entry point.
_main "$1"

#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION

	if [ "$1" ]; then
		local INSTITUTION=${1}
	else
		local INSTITUTION="all"
	fi

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/citations/generate_json.py --institution-id="$INSTITUTION"
	popd || exit
}

# Invoke entry point.
_main "$1"

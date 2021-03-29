#!/usr/bin/env bash

# Main entry point.
function _main()
{
	if [ "$1" ]; then
		local institution=$1
	else
		local institution=all
	fi

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/citations/generate_json.py --institution-id=$institution
	popd || exit
}

# Invoke entry point.
_main "$1"

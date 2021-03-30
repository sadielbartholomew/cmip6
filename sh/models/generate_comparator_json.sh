#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local DIR_OUTPUT=${1}

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/models/generate_comparator_json.py --destination "$DIR_OUTPUT"
	popd || exit
}

# Invoke entry point.
_main "$1"
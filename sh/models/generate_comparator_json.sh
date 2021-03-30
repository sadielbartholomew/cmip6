#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local DIR_OUTPUT=${1}

	pipenv run python "$CMIP6_HOME"/lib/models/generate_comparator_json.py --destination "$DIR_OUTPUT"
}

# Invoke entry point.
_main "$1"
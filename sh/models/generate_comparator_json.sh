#!/usr/bin/env bash

# Main entry point.
function _main()
{
	pipenv run python "$CMIP6_HOME"/lib/models/generate_comparator_json.py --destination $1
}

# Invoke entry point.
_main "$1"
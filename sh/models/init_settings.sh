#!/usr/bin/env bash

# Main entry point.
function _main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	pipenv run python "$CMIP6_HOME"/lib/models/init_settings.py --institution-id=$institution
}

# Invoke entry point.
_main "$1"
#!/usr/bin/env bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		local institution=$1
	else
		local institution=all
	fi

	pipenv run python "$CMIP6_HOME"/lib/citations/generate_json.py --institution-id=$institution
}

# Invoke entry point.
main $1

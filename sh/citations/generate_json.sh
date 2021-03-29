#!/usr/bin/env bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		local institution=$1
	else
		local institution=all
	fi

	pushd "$CMIP6_HOME"
	pipenv run python "$CMIP6_HOME"/lib/citations/generate_json.py --institution-id=$institution
	popd
}

# Invoke entry point.
main $1

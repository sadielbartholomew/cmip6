#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local DIR_INPUT
	local DIR_OUTPUT

	on_cmd_begin "conformances-write-config"

	DIR_INPUT=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	DIR_OUTPUT=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/conformances/config
	rm -rf "$DIR_OUTPUT"/*.json

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/conformances/write_config.py --input="$DIR_INPUT" --output="$DIR_OUTPUT"
	popd || exit

	on_cmd_end "conformances-write-config"
}

# Invoke entry point.
_main

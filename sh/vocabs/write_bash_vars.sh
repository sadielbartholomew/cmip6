#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local PATH_TO_OUTPUT_FILE

	PATH_TO_OUTPUT_FILE=$CMIP6_HOME/sh/vocabs/write_bash_vars_output.txt
	
	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/vocabs/write_bash_vars.py --output-fpath="$PATH_TO_OUTPUT_FILE"
	popd || exit

	cp "$PATH_TO_OUTPUT_FILE" "$CMIP6_HOME"/sh/vocabs/definitions.sh
	rm "$PATH_TO_OUTPUT_FILE"

	log "WCRP cmip6 vocabs bash file written to $CMIP6_HOME/sh/vocabs/definitions.sh"
}

# Invoke entry point.
_main

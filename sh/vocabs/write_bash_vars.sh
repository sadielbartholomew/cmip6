#!/usr/bin/env bash

# Main entry point.
function _main()
{
	output_fpath=$CMIP6_HOME/sh/vocabs/write_bash_vars_output.txt
	
	pipenv run python "$CMIP6_HOME"/lib/vocabs/write_bash_vars.py --output-fpath=$output_fpath

	cp $output_fpath "$CMIP6_HOME"/sh/vocabs/definitions.sh
	rm $output_fpath

	log "WCRP cmip6 vocabs bash file written to "$CMIP6_HOME/sh/vocabs/definitions.sh
}

# Invoke entry point.
_main

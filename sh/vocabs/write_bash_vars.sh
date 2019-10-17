#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "other-write-bash-vars"

	python $CMIP6_LIB/other/write_bash_vars.py

	cp $CMIP6_LIB/other/write_bash_vars_output.txt $CMIP6_BASH/utils_vocabs.sh

	log "WCRP cmip6 vocabs bash file written to "$CMIP6_BASH/utils_vocabs.sh

	on_cmd_end "other-write-bash-vars"
}

# Invoke entry point.
main
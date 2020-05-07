#!/bin/bash

# Main entry point.
main()
{
	output_fpath=$CMIP6_BASH/vocabs/write_bash_vars_output.txt
	
	python $CMIP6_LIB/vocabs/write_bash_vars.py --output-fpath=$output_fpath

	cp $output_fpath $CMIP6_BASH/vocabs/definitions.sh
	rm $output_fpath

	log "WCRP cmip6 vocabs bash file written to "$CMIP6_BASH/vocabs/definitions.sh
}

# Invoke entry point.
main
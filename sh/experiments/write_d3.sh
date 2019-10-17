#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "experiments-write-d3"

	declare input_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/d3
	rm -rf $output_dir/*.*
	python $CMIP6_LIB/experiments/write_d3.py --input=$input_dir --output=$output_dir

	on_cmd_begin "experiments-write-d3"
}

# Invoke entry point.
main

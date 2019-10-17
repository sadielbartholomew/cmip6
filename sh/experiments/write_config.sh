#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "experiments-write-config"

	declare input_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/config
	rm -rf $output_dir/*.json
	python $CMIP6_LIB/experiments/write_config.py --input=$input_dir --output=$output_dir

	on_cmd_end "experiments-write-config"
}

# Invoke entry point.
main

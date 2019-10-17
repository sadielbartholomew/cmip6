#!/bin/bash

# Main entry point.
main()
{
	declare input_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/config

	rm -rf $output_dir/*.json

	python $CMIP6_LIB/experiments/write_config.py --input=$input_dir --output=$output_dir
}

# Invoke entry point.
main

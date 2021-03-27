#!/usr/bin/env bash

# Main entry point.
main()
{
	declare input_dir=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/d3

	rm -rf $output_dir/*.*

	pipenv run python $CMIP6_HOME/lib/experiments/write_d3.py --input=$input_dir --output=$output_dir
}

# Invoke entry point.
main

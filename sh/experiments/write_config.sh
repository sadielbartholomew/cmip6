#!/usr/bin/env bash

# Main entry point.
main()
{
	declare input_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/config

	rm -rf $output_dir/*.json

	pipenv run python "$CMIP6_HOME"/lib/experiments/write_config.py --input=$input_dir --output=$output_dir
}

# Invoke entry point.
main

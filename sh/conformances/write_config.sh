#!/usr/bin/env bash

# Main entry point.
main()
{
	on_cmd_begin "conformances-write-config"

	declare input_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/conformances/config
	rm -rf $output_dir/*.json
	pipenv run python "$CMIP6_HOME"/lib/conformances/write_config.py --input=$input_dir --output=$output_dir

	on_cmd_end "conformances-write-config"
}

# Invoke entry point.
main

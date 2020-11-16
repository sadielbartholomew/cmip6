#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "conformances-write-config"

	declare input_dir=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/conformances/config
	rm -rf $output_dir/*.json
	pipenv run python $CMIP6_LIB/conformances/write_config.py --input=$input_dir --output=$output_dir

	on_cmd_end "conformances-write-config"
}

# Invoke entry point.
main

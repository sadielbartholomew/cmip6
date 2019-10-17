#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "conformances-write-spreadsheets"

	declare input_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/conformances/spreadsheets
	rm -rf $output_dir/*.*
	python $CMIP6_LIB/conformances/write_spreadsheets.py --input=$input_dir --output=$output_dir

	on_cmd_end "conformances-write-spreadsheets"
}

# Invoke entry point.
main

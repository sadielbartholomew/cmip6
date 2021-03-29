#!/usr/bin/env bash

# Main entry point.
function _main()
{
	on_cmd_begin "conformances-write-spreadsheets"

	declare input_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	declare output_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/conformances/spreadsheets
	rm -rf $output_dir/*.*

	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/conformances/write_spreadsheets.py --input=$input_dir --output=$output_dir
	popd || exit

	on_cmd_end "conformances-write-spreadsheets"
}

# Invoke entry point.
_main

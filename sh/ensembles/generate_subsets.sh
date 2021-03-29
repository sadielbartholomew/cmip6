#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local ARCHIVE_DIR
	local INSTITUTION
	local OUTPUT_DIR

	on_cmd_begin "ensembles-generate-subsets"

	if [ "$1" ]; then
		INSTITUTION="$1"
	else
		INSTITUTION="all"
	fi
    ARCHIVE_DIR="$CMIP6_HOME"/repos/archives/esdoc-cdf2cim-archive/data
	OUTPUT_DIR="$CMIP6_HOME"/repos/archives/esdoc-cdf2cim-archive/subset

	pipenv run python "$CMIP6_HOME"/lib/ensembles/generate_subsets.py --institution-id="$INSTITUTION" --archive-directory="$ARCHIVE_DIR" --output-directory="$OUTPUT_DIR"

	on_cmd_end "ensembles-generate-subsets"
}

# Invoke entry point.
_main "$1"

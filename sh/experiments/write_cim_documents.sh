#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local DIR_IO
	local PATH_TO_SPREADSHEET
	local PATH_TO_IDENTIFIERS

	DIR_IO="$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	PATH_TO_SPREADSHEET="$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/experiments/spreadsheet/experiments.xlsx
	PATH_TO_IDENTIFIERS="$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/experiments/spreadsheet/document-identifiers.txt

	rm -rf "$DIR_IO"
	mkdir "$DIR_IO"

	pipenv run python "$CMIP6_HOME"/lib/experiments/write_cim_documents --io-dir="$DIR_IO" --spreadsheet="$PATH_TO_SPREADSHEET" --identifiers="$PATH_TO_IDENTIFIERS"
}

# Invoke entry point.
_main

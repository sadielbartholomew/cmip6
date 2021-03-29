#!/usr/bin/env bash

# Main entry point.
function _main()
{
	declare io_dir=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	declare spreadsheet=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/spreadsheet/experiments.xlsx
	declare identifiers=$CMIP6_HOME/repos/libs/esdoc-docs/cmip6/experiments/spreadsheet/document-identifiers.txt

	rm -rf $io_dir
	mkdir $io_dir

	pipenv run python "$CMIP6_HOME"/lib/experiments/write_cim_documents --io-dir=$io_dir --spreadsheet=$spreadsheet --identifiers=$identifiers
}

# Invoke entry point.
_main

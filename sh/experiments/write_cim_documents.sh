#!/bin/bash

# Main entry point.
main()
{
	declare io_dir=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/cim-documents
	declare spreadsheet=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/spreadsheet/experiments.xlsx
	declare identifiers=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/spreadsheet/document-identifiers.txt

	rm -rf $io_dir
	mkdir $io_dir

	pipenv run python $CMIP6_LIB/experiments/write_cim_documents --io-dir=$io_dir --spreadsheet=$spreadsheet --identifiers=$identifiers
}

# Invoke entry point.
main

#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "experiments-write-cim-documents"

	declare io_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/cim-documents
	declare spreadsheet=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/spreadsheet/experiments.xlsx
	declare identifiers=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/spreadsheet/document-identifiers.txt
	rm -rf $io_dir/*.json
	python $CMIP6_LIB/experiments/write_cim_documents --io-dir=$io_dir --spreadsheet=$spreadsheet --identifiers=$identifiers

	on_cmd_end "experiments-write-cim-documents"
}

# Invoke entry point.
main

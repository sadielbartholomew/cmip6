#!/bin/bash

# Main entry point.
main()
{
	declare source_dir=$ESDOC_HOME/repos/core/esdoc-docs/cmip6/experiments/cim-documents
	declare target_dir=$ESDOC_HOME/repos/core/esdoc-archive/esdoc/cmip6/spreadsheet-experiments

	rm -rf $target_dir
	mkdir -p $target_dir

	pipenv run python $CMIP6_LIB/experiments/archive_cim_documents.py --source-dir=$source_dir --target-dir=$target_dir
}

# Invoke entry point.
main

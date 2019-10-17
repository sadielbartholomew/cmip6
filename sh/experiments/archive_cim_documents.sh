#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "experiments-archive-cim-documents"

	declare source_dir=$ESDOC_DIR_REPOS_CORE/esdoc-docs/cmip6/experiments/cim-documents
	declare target_dir=$ESDOC_DIR_REPOS_CORE/esdoc-archive/esdoc/cmip6/spreadsheet-experiments
	rm -rf $target_dir
	mkdir -p $target_dir
	python $CMIP6_LIB/experiments/archive_cim_documents.py --source-dir=$source_dir --target-dir=$target_dir

	on_cmd_end "experiments-archive-cim-documents"
}

# Invoke entry point.
main

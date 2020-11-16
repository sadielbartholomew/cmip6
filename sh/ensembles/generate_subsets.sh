#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
function main()
{
	on_cmd_begin "ensembles-generate-subsets"

	if [ "$1" ]; then
		declare institution=$1
	else
		declare institution=all
	fi
    declare archive_dir=$ESDOC_HOME/repos/core/esdoc-cdf2cim-archive/data
	declare output_dir=$ESDOC_HOME/repos/core/esdoc-cdf2cim-archive/subset
	pipenv run python $CMIP6_LIB/ensembles/generate_subsets.py --institution-id=$institution --archive-directory=$archive_dir --output-directory=$output_dir

	on_cmd_begin "ensembles-generate-subsets"
}

# Invoke entry point.
main $1

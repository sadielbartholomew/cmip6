#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "models-archive-cim-documents"

	archive_folder=$ESDOC_ARCHIVE_HOME/esdoc/cmip6/spreadsheet-models

	if [ ! -d "$archive_folder" ]; then
		mkdir $archive_folder
	fi

	if [ "$1" ]; then
		rm -rf $archive_folder/cmip6_$1*.*
	else
		rm -rf $archive_folder/*.*
	fi

	python $CMIP6_LIB/models/archive_cim_documents.py --destination=$archive_folder --institution-id=$1

	on_cmd_end "models-archive-cim-documents"
}

# Invoke entry point.
main $1

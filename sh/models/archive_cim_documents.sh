#!/usr/bin/env bash

# Main entry point.
main()
{
	archive_folder=$ESDOC_ARCHIVE_HOME/esdoc/cmip6/spreadsheet-models

	if [ ! -d "$archive_folder" ]; then
		mkdir $archive_folder
	fi

	if [ "$1" ]; then
		rm -rf $archive_folder/cmip6_$1*.*
	else
		rm -rf $archive_folder/*.*
	fi

	pipenv run python $CMIP6_HOME/lib/models/archive_cim_documents.py --destination=$archive_folder --institution-id=$1
}

# Invoke entry point.
main $1

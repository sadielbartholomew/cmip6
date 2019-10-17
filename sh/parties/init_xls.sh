#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "parties-init-xls"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi
	xls_template=$ESDOC_DIR_BASH/cmip6/parties/templates/responsible-parties.xlsx

	python $CMIP6_LIB/parties/init_xls.py --institution-id=$institution --xls-template=$xls_template

	on_cmd_end "parties-init-xls"
}

# Invoke entry point.
main $1

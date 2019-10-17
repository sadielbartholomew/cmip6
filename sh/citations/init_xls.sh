#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "citations-init-xls"

	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi
	xls_template=$CMIP6_LIB/citations/templates/citations.xlsx
	python $CMIP6_LIB/citations/init_xls.py --institution-id=$institution --xls-template=$xls_template

	on_cmd_end "citations-init-xls"
}

# Invoke entry point.
main $1

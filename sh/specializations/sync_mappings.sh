#!/bin/bash

# Main entry point.
main()
{
	rm -rf $ESDOC_DIR_BASH/cmip6/models/init_output/csv-files/*.csv
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/mappings/*.csv $ESDOC_DIR_BASH/cmip6/models/init_output/csv-files
	done
}

# Invoke entry point.
main

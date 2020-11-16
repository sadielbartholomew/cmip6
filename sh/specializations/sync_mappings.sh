#!/bin/bash

# Main entry point.
main()
{
	rm -rf $CMIP6_LIB/models/init_json_from_cmip5/csv-files/*.csv
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/mappings/*.csv $CMIP6_LIB/models/init_json_from_cmip5/csv-files
	done
}

# Invoke entry point.
main

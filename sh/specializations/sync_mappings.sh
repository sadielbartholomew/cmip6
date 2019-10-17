#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-sync-mappings"

	rm -rf $ESDOC_DIR_BASH/cmip6/models/init_output/csv-files/*.csv
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/mappings/*.csv $ESDOC_DIR_BASH/cmip6/models/init_output/csv-files
	done

	on_cmd_end "specializations-sync-mappings"
}

# Invoke entry point.
main

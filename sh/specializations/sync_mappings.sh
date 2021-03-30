#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local SPECIALIZATION
	
	rm -rf "$CMIP6_HOME"/lib/models/init_json_from_cmip5/csv-files/*.csv
	for SPECIALIZATION in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/mappings/*.csv \
		   "$CMIP6_HOME"/lib/models/init_json_from_cmip5/csv-files
	done
}

# Invoke entry point.
_main

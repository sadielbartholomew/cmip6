#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local SPECIALIZATION

	# Sync data files.
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp -r "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/_"$SPECIALIZATION".js \
		      "$CMIP6_HOME"/repos/libs/esdoc-web-view-specialization/data/cmip6_"$SPECIALIZATION".js
	done
}

# Invoke entry point.
_main

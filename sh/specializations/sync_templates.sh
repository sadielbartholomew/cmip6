#!/usr/bin/env bash

# Main entry point.
function _main()
{
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		rm -rf "$CMIP6_HOME"/repos/specializations/cmip6-specializations-$specialization/templates
		mkdir "$CMIP6_HOME"/repos/specializations/cmip6-specializations-$specialization/templates
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/templates/* "$CMIP6_HOME"/repos/specializations/cmip6-specializations-$specialization/templates
	done
}

# Invoke entry point.
_main

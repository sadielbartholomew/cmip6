#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local SPECIALIZATION
	local PATH_TO_TEMPLATES

	for SPECIALIZATION in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		PATH_TO_TEMPLATES="$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/templates
		rm -rf "$PATH_TO_TEMPLATES"
		mkdir "$PATH_TO_TEMPLATES"
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/templates/* \
		   "$PATH_TO_TEMPLATES"
	done
}

# Invoke entry point.
_main

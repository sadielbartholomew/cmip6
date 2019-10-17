#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp $ESDOC_DIR_CMIP6/cmip6-specializations-toplevel/cim_profile.py $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/generate/cim_profile.py
	done
}

# Invoke entry point.
main

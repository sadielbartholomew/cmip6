#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp $CMIP6_ROOT/cmip6-specializations-toplevel/cim_profile.py $CMIP6_ROOT/cmip6-specializations-$specialization/generate/cim_profile.py
	done
}

# Invoke entry point.
main

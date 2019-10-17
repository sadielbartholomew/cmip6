#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-sync-cim-profile"

	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		cp $ESDOC_DIR_CMIP6/cmip6-specializations-toplevel/cim_profile.py $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/generate/cim_profile.py
	done

	on_cmd_end "specializations-sync-cim-profile"
}

# Invoke entry point.
main

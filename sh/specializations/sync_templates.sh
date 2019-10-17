#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-sync-templates"

	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		rm -rf $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/templates
		mkdir $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/templates
		cp $ESDOC_DIR_CMIP6/cmip6-specializations-toplevel/templates/* $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/templates
	done

	on_cmd_end "specializations-sync-templates"
}

# Invoke entry point.
main

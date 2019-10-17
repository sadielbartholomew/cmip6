#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		rm -rf $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/templates
		mkdir $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/templates
		cp $ESDOC_DIR_CMIP6/cmip6-specializations-toplevel/templates/* $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/templates
	done
}

# Invoke entry point.
main

#!/usr/bin/env bash

# Main entry point.
main()
{
	# Sync data files.
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp -r $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/_$specialization.js $ESDOC_HOME/repos/core/esdoc-web-view-specialization/data/cmip6_$specialization.js
	done
}

# Invoke entry point.
main

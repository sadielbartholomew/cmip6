#!/bin/bash

# Main entry point.
main()
{
	# Sync data files.
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp -r $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/_$specialization.js $ESDOC_DIR_REPOS_CORE/esdoc-web-view-specialization/data/cmip6_$specialization.js
	done
}

# Invoke entry point.
main

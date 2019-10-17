#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-sync-viewer"

	# Sync data files.
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp -r $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/_$specialization.js $ESDOC_DIR_REPOS_CORE/esdoc-web-view-specialization/data/cmip6_$specialization.js
	done

	on_cmd_end "specializations-sync-viewer"
}

# Invoke entry point.
main

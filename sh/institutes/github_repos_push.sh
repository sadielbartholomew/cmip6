#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local COMMENT=${1}
    local INSTITUTION_ID

	for INSTITUTION_ID in "${CMIP6_INSTITUTION_ID[@]}"
	do
		if [ -d "$CMIP6_HOME"/repos/institutions/"$INSTITUTION_ID" ]; then
			log "GITHUB : pushing  $INSTITUTION_ID"
			pushd "$CMIP6_HOME"/repos/institutions/"$INSTITUTION_ID" || exit
			git add *
			git commit -S -a -m "$COMMENT"
			git push origin master
			popd || exit
		else
			log "institutional repo needs to be installed: $INSTITUTION_ID"
		fi
	done
}

# Invoke entry point.
_main "$1"

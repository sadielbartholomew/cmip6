#!/usr/bin/env bash

# Main entry point.
main()
{
	local COMMENT=${1}
	local SPECIALIZATION

	# Push specializations.
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "pushing "$specialization
		pushd "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"
		git add .
		git commit -m "$COMMENT"
		git push -v origin master:master
		popd
	done

	# Push viewer.
	pushd "$CMIP6_HOME"/repos/libs/esdoc-web-view-specialization
	git add .
	git commit -m "$COMMENT"
	git push -v origin master:master
	popd
}

# Invoke entry point.
main $1

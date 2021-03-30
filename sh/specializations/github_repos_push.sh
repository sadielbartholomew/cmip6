#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local COMMENT=${1}
	local SPECIALIZATION
	local REPO_NAME
	local PATH_TO_REPO

	# Push specializations.
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		REPO_NAME=cmip6-specializations-"$SPECIALIZATION"
		PATH_TO_REPO=$(get_path_to_repo "specializations" "$REPO_NAME")
		if [ -d "$PATH_TO_REPO" ]; then
			log "GITHUB : pushing  $SPECIALIZATION"
			pushd "$PATH_TO_REPO" || exit
			git add "*"
			git commit -S -a -m "$COMMENT"
			git push origin master
			popd || exit
		else
			log "specialization repo needs to be installed: $SPECIALIZATION"
		fi
	done

	# Push viewer.
	PATH_TO_REPO=$(get_path_to_repo "libs" "esdoc-web-view-specialization")
	if [ -d "$PATH_TO_REPO" ]; then
		log "GITHUB : pushing web-viewer"
		pushd "$PATH_TO_REPO" || exit
		git add "*"
		git commit -m "$COMMENT"
		git push -v origin master:master
		popd || exit
	else
		log "specialization web viewer repo needs to be installed: $SPECIALIZATION"
	fi
}

# Invoke entry point.
_main "$1"

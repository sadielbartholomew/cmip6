#!/usr/bin/env bash

# Main entry point.
main()
{
	declare comment=$1

	# Push specializations.
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "pushing "$specialization
		pushd $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization
		git add .
		git commit -m $comment
		git push -v origin master:master
		popd
	done

	# Push viewer.
	pushd $ESDOC_HOME/repos/esdoc-web-view-specialization
	git add .
	git commit -m $comment
	git push -v origin master:master
	popd
}

# Invoke entry point.
main $1

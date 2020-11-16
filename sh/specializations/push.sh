#!/bin/bash

# Main entry point.
main()
{
	declare comment=$1

	# Push specializations.
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "pushing "$specialization
		pushd $CMIP6_ROOT/cmip6-specializations-$specialization
		git add .
		git commit -m $comment
		git push -v origin master:master
		popd -1
	done

	# Push viewer.
	pushd $ESDOC_HOME/repos/esdoc-web-view-specialization
	git add .
	git commit -m $comment
	git push -v origin master:master
	popd -1
}

# Invoke entry point.
main $1

#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Import vocab.
source $CMIP6_BASH/specializations/vocab.sh

# Main entry point.
main()
{
	on_cmd_begin "specializations-push"

	declare comment=$1

	# Push specializations.
	cd $ESDOC_HOME/repos
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "CMIP6-SPECS : pushing "$specialization
		cd $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization
		git add .
		git commit -m $comment
		git push -v origin master:master
	done

	# Push viewer.
	cd $ESDOC_HOME/repos/esdoc-web-view-specialization
	git add .
	git commit -m $comment
	git push -v origin master:master

	on_cmd_end "specializations-push"
}

# Invoke entry point.
main $1

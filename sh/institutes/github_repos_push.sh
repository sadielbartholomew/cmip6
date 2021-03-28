#!/usr/bin/env bash

# Main entry point.
main()
{
	local MSG=${1}

	for institution_id in "${CMIP6_INSTITUTION_ID[@]}"
	do
		pushd $ESDOC_HOME/repos/institutional/$institution_id
		git add *
		git commit -S -a -m $MSG
		git push origin master
		popd
	done
}

# Invoke entry point.
main $1

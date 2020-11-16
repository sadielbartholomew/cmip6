#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTION_ID[@]}"
	do
		pushd $ESDOC_HOME/repos/institutional/$institution_id
		git add *
		git commit -S -a -m $1
		git push origin master
		popd -1
	done
}

# Invoke entry point.
main $1

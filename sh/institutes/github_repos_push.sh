#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTION_ID[@]}"
	do
		cd $ESDOC_HOME/repos/institutional/$institution_id
		git add *
		git commit -S -a -m $1
		git push origin master
	done
}

# Invoke entry point.
main $1

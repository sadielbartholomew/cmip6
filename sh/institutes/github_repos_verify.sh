#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	pipenv run python $CMIP6_LIB/institutes/github_repos_verify.py --institution-id=$1
}

# Invoke entry point.
main $1
#!/usr/bin/env bash

# Main entry point.
main()
{
	local INSTITUTION_ID

	if [ "$1" ]; then
		INSTITUTION_ID=$1
	else
		INSTITUTION_ID=all
	fi

	pipenv run python "$CMIP6_HOME"/lib/institutes/github_repos_verify.py --institution-id="$INSTITUTION_ID"
}

# Invoke entry point.
main $1
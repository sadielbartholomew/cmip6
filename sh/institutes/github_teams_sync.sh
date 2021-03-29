#!/usr/bin/env bash

# Main entry point.
function _main()
{
	pushd "$CMIP6_HOME" || exit
	pipenv run python "$CMIP6_HOME"/lib/institutes/github_teams_sync.py
	popd || exit
}

# Invoke entry point.
_main

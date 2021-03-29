#!/usr/bin/env bash

# Main entry point.
main()
{
	pushd "$CMIP6_HOME"
	pipenv run python "$CMIP6_HOME"/lib/institutes/github_teams_sync.py
	popd
}

# Invoke entry point.
main

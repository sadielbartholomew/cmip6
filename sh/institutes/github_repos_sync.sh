#!/usr/bin/env bash

# Main entry point.
main()
{
	activate_venv

	pipenv run python "$CMIP6_HOME"/lib/institutes/github_repos_sync.py
}

# Invoke entry point.
main

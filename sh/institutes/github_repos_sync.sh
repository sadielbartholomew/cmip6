#!/bin/bash

# Main entry point.
main()
{
	activate_venv

	python $CMIP6_LIB/institutes/github_repos_sync.py
}

# Invoke entry point.
main

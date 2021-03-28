#!/usr/bin/env bash

# Main entry point.
main()
{
	pipenv run python "$CMIP6_HOME"/lib/models/init_cmip5_docs.py
}

# Invoke entry point.
main
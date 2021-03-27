#!/usr/bin/env bash

# Main entry point.
main()
{
	pipenv run python $CMIP6_HOME/lib/institutes/list.py
}

# Invoke entry point.
main
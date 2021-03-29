#!/usr/bin/env bash

# Main entry point.
function _main()
{
	pipenv run python "$CMIP6_HOME"/lib/institutes/list.py
}

# Invoke entry point.
_main
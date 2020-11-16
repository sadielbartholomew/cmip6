#!/bin/bash

# Main entry point.
main()
{
	pipenv run python $CMIP6_LIB/institutes/list.py
}

# Invoke entry point.
main
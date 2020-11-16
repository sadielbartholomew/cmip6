#!/bin/bash

# Main entry point.
main()
{
	pipenv run python $CMIP6_LIB/models/init_cmip5_docs.py
}

# Invoke entry point.
main
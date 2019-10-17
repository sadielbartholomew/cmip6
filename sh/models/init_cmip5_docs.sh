#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin "models-init-cmip5-docs"

	python $CMIP6_LIB/models/init_cmip5_docs.py

	on_cmd_end "models-init-cmip5-docs"
}

# Invoke entry point.
main
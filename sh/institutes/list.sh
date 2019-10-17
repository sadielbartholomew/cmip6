#!/bin/bash

# Import utils.
source $CMIP6_BASH/utils.sh

# Main entry point.
main()
{
	on_cmd_begin 'list-institutes'

	python $CMIP6_LIB/institutes/list.py

	on_cmd_end 'list-institutes'
}

# Invoke entry point.
main
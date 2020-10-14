#!/bin/bash

# Main entry point.
main()
{
	python $CMIP6_LIB/models/generate_comparator_json.py --destination $1
}

# Invoke entry point.
main $1
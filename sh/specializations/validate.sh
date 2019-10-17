#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		declare specialization=$1
		python $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/validate
	else
		for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			python $ESDOC_DIR_CMIP6/cmip6-specializations-$specialization/validate
		done
	fi
}

# Invoke entry point.
main $1

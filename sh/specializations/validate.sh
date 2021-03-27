#!/usr/bin/env bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		declare specialization=$1
		pipenv run python $CMIP6_ROOT/cmip6-specializations-$specialization/validate
	else
		for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			pipenv run python $CMIP6_ROOT/cmip6-specializations-$specialization/validate
		done
	fi
}

# Invoke entry point.
main $1

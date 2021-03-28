#!/usr/bin/env bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log_banner
		log "status : "$specialization
		log_banner
		pushd $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization
		git status
		popd
	done
}

# Invoke entry point.
main

#!/usr/bin/env bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log_banner
		log "pulling "$specialization
		log_banner
		pushd $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization
		git pull
		popd
	done
}

# Invoke entry point.
main

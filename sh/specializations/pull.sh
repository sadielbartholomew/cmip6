#!/usr/bin/env bash

# Main entry point.
main()
{
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log_banner
		log "pulling "$specialization
		log_banner
		pushd $CMIP6_ROOT/cmip6-specializations-$specialization
		git pull
		popd -1
	done
}

# Invoke entry point.
main

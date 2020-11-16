#!/bin/bash

# Main entry point.
main()
{
	mkdir -p $CMIP6_ROOT
	pushd $CMIP6_ROOT
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		log "cloning "$specialization
		git clone https://github.com/ES-DOC/cmip6-specializations-$specialization.git
	done
	popd -1
}

# Invoke entry point.
main

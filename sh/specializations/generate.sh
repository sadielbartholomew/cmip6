#!/usr/bin/env bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		declare specialization=$1
		log_banner
		log "generating "$specialization
		log_banner
		pipenv run python "$CMIP6_HOME"/repos/specializations/cmip6-specializations-$specialization/generate
	else
		for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			log_banner
			log "generating "$specialization
			log_banner
			pipenv run python "$CMIP6_HOME"/repos/specializations/cmip6-specializations-$specialization/generate
		done
	fi
}

# Invoke entry point.
main $1

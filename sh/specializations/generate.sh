#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local SPECIALIZATION

	if [ "$1" ]; then
		SPECIALIZATION=${1}
		log_banner
		log "generating $SPECIALIZATION"
		log_banner

		pushd "$CMIP6_HOME" || exit
		pipenv run python "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/generate
		popd || exit
	else
		for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			log_banner
			log "generating $SPECIALIZATION"
			log_banner
			pushd "$CMIP6_HOME" || exit
			pipenv run python "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/generate
			popd || exit
		done
	fi
}

# Invoke entry point.
_main "$1"

#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local SPECIALIZATION
	local PATH_TO_SPECIALIZATION
	local PATH_TO_PYESDOC_SPECIALIZATIONS
	
	# Sync definitions.
	for SPECIALIZATION in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		PATH_TO_SPECIALIZATION="$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"
		# ... generator
		rm -rf "$PATH_TO_SPECIALIZATION"/generate
		mkdir "$PATH_TO_SPECIALIZATION"/generate
		cp -r "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/* \
		      "$PATH_TO_SPECIALIZATION"/generate

		# ... validator
		rm -rf "$PATH_TO_SPECIALIZATION"/validate
		mkdir "$PATH_TO_SPECIALIZATION"/validate
		cp -r "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/validate/* 
		      "$PATH_TO_SPECIALIZATION"/validate

		log "... synced: $SPECIALIZATION"
	done

	# Sync to pyesdoc.
	PATH_TO_PYESDOC_SPECIALIZATIONS="$CMIP6_HOME"/repos/libs/esdoc-py-client/pyesdoc/mp/specializations
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils_cache.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils_constants.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils_factory.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils_loader.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils_model.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-toplevel/generate/utils_parser.py \
	   "$PATH_TO_PYESDOC_SPECIALIZATIONS"
	log "... synced: pyesdoc"
}

# Invoke entry point.
_main

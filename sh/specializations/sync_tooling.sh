#!/usr/bin/env bash

# Main entry point.
main()
{
	# Sync definitions.
	for specialization in "${CMIP6_REALM_SPECIALIZATIONS[@]}"
	do
		# ... generator
		rm -rf $CMIP6_ROOT/cmip6-specializations-$specialization/generate
		mkdir $CMIP6_ROOT/cmip6-specializations-$specialization/generate
		cp -r $CMIP6_ROOT/cmip6-specializations-toplevel/generate/* $CMIP6_ROOT/cmip6-specializations-$specialization/generate

		# ... validator
		rm -rf $CMIP6_ROOT/cmip6-specializations-$specialization/validate
		mkdir $CMIP6_ROOT/cmip6-specializations-$specialization/validate
		cp -r $CMIP6_ROOT/cmip6-specializations-toplevel/validate/* $CMIP6_ROOT/cmip6-specializations-$specialization/validate

		log "... synced: "$specialization
	done

	# Sync to pyesdoc.
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils_cache.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils_constants.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils_factory.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils_loader.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils_model.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	cp $CMIP6_ROOT/cmip6-specializations-toplevel/generate/utils_parser.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations
	log "... synced: pyesdoc"
}

# Invoke entry point.
main

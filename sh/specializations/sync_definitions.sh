#!/bin/bash

# Main entry point.
main()
{
	log "syncing py files ..."
	rm $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations/cmip6/*.py
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/$specialization*.py $ESDOC_HOME/repos/core/esdoc-py-client/pyesdoc/mp/specializations/cmip6
	done

	log "syncing csv files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/csv/$specialization-ids-level-1.csv
		rm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/csv/$specialization-ids-level-2.csv
		rm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/csv/$specialization-ids-level-3.csv
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/_$specialization-ids-level-1.csv $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/csv/$specialization-ids-level-1.csv
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/_$specialization-ids-level-2.csv $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/csv/$specialization-ids-level-2.csv
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/_$specialization-ids-level-3.csv $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/csv/$specialization-ids-level-3.csv
	done

	log "syncing json files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/config/$specialization.json
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/_$specialization.json $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/config/$specialization.json
	done

	log "syncing mindmap files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/mindmaps/$specialization.mm
		cp $CMIP6_ROOT/cmip6-specializations-$specialization/_$specialization.mm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/mindmaps/$specialization.mm
	done

	log "syncing cmip5 mapping files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		if [ $specialization != "toplevel" ]; then
			rm $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/cmip5-mappings/$specialization-*.csv
			cp $CMIP6_ROOT/cmip6-specializations-$specialization/mappings/*.csv $ESDOC_HOME/repos/core/esdoc-docs/cmip6/models/cmip5-mappings
		fi
	done
}

# Invoke entry point.
main

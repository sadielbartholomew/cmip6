#!/usr/bin/env bash

# Main entry point.
main()
{
	log "syncing py files ..."
	rm $CMIP6_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cmip6/*.py
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/$specialization*.py $CMIP6_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cmip6
	done

	log "syncing csv files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/csv/$specialization-ids-level-1.csv
		rm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/csv/$specialization-ids-level-2.csv
		rm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/csv/$specialization-ids-level-3.csv
		cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/_$specialization-ids-level-1.csv $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/csv/$specialization-ids-level-1.csv
		cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/_$specialization-ids-level-2.csv $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/csv/$specialization-ids-level-2.csv
		cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/_$specialization-ids-level-3.csv $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/csv/$specialization-ids-level-3.csv
	done

	log "syncing json files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/config/$specialization.json
		cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/_$specialization.json $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/config/$specialization.json
	done

	log "syncing mindmap files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/mindmaps/$specialization.mm
		cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/_$specialization.mm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/mindmaps/$specialization.mm
	done

	log "syncing cmip5 mapping files ..."
	for specialization in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		if [ $specialization != "toplevel" ]; then
			rm $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/cmip5-mappings/$specialization-*.csv
			cp $CMIP6_HOME/repos/specializations/cmip6-specializations-$specialization/mappings/*.csv $CMIP6_HOME/repos/libs/esdoc-docs/cmip6/models/cmip5-mappings
		fi
	done
}

# Invoke entry point.
main

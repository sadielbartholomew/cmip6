#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local SPECIALIZATION

	log "syncing py files ..."
	rm "$CMIP6_HOME"/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cmip6/*.py
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/"$SPECIALIZATION"*.py 
		   "$CMIP6_HOME"/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cmip6
	done

	log "syncing csv files ..."
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/csv/"$SPECIALIZATION"-ids-level-1.csv
		rm "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/csv/"$SPECIALIZATION"-ids-level-2.csv
		rm "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/csv/"$SPECIALIZATION"-ids-level-3.csv
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/_"$SPECIALIZATION"-ids-level-1.csv \
		   "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/csv/"$SPECIALIZATION"-ids-level-1.csv
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/_"$SPECIALIZATION"-ids-level-2.csv \
		   "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/csv/"$SPECIALIZATION"-ids-level-2.csv
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/_"$SPECIALIZATION"-ids-level-3.csv \
		   "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/csv/"$SPECIALIZATION"-ids-level-3.csv
	done

	log "syncing json files ..."
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/config/"$SPECIALIZATION".json
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/_"$SPECIALIZATION".json \
		   "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/config/"$SPECIALIZATION".json
	done

	log "syncing mindmap files ..."
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		rm "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/mindmaps/"$SPECIALIZATION".mm
		cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/_"$SPECIALIZATION".mm \
		   "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/mindmaps/"$SPECIALIZATION".mm
	done

	log "syncing cmip5 mapping files ..."
	for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
	do
		if [ "$SPECIALIZATION" != "toplevel" ]; then
			rm "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/cmip5-mappings/"$SPECIALIZATION"-*.csv
			cp "$CMIP6_HOME"/repos/specializations/cmip6-specializations-"$SPECIALIZATION"/mappings/*.csv \
			   "$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/models/cmip5-mappings
		fi
	done
}

# Invoke entry point.
_main

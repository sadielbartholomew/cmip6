#!/usr/bin/env bash

# Main entry point.
main()
{
	local SOURCE_DIR
	local TARGET_DIR

	SOURCE_DIR="$CMIP6_HOME"/repos/libs/esdoc-docs/cmip6/experiments/cim-documents
	TARGET_DIR="$CMIP6_HOME"/repos/archives/esdoc-archive/esdoc/cmip6/spreadsheet-experiments

	rm -rf "$TARGET_DIR"
	mkdir -p "$TARGET_DIR"

	pipenv run python "$CMIP6_HOME"/lib/experiments/archive_cim_documents.py --source-dir="$SOURCE_DIR" --target-dir="$TARGET_DIR"
}

# Invoke entry point.
main

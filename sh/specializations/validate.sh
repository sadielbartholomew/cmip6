#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local PATH_TO_REPO
	local REPO_NAME
	local SPECIALIZATION

	if [ "$1" ]; then
		_validate "$1"
	else
		for SPECIALIZATION in "${CMIP6_SPECIALIZATIONS[@]}"
		do
			_validate "$SPECIALIZATION"
		done
	fi
}

function _validate()
{
	local PATH_TO_REPO
	local REPO_NAME
	local SPECIALIZATION=${1}

	REPO_NAME=cmip6-specializations-"$SPECIALIZATION"
	PATH_TO_REPO=$(get_path_to_repo "specializations" "$REPO_NAME")
	pushd "$CMIP6_HOME" || exit
	pipenv run python "$PATH_TO_REPO"/validate
	popd || exit
}

# Invoke entry point.
_main "$1"

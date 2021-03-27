#!/usr/bin/env bash

# Activates a virtual environment.
function activate_venv()
{
	export PYTHONPATH=$CMIP6_HOME:$PYTHONPATH
	pushd $CMIP6_HOME
	# source $CMIP6_HOME/lib_VENV/bin/activate
	# log "venv activated @ "$CMIP6_HOME/lib_VENV
}

# Wraps standard echo by adding ESDOC prefix.
log()
{
	declare now=`date +%Y-%m-%dT%H:%M:%S:000000`
	declare tabs=''
	if [ "$1" ]; then
		if [ "$2" ]; then
			for ((i=0; i<$2; i++))
			do
				declare tabs+='\t'
			done
	    	echo -e $now" [INFO] :: CMIP6 :: "$tabs$1
	    else
	    	echo -e $now" [INFO] :: CMIP6 :: "$1
	    fi
	else
	    echo -e $now" [INFO] :: CMIP6 :: "
	fi
}

# Outputs a line to split up logging.
log_banner()
{
	echo "-------------------------------------------------------------------------------"
}

# Event handler: on command execution start.
on_cmd_begin()
{
	log_banner
	log $1" :: BEGINS"
	activate_venv
	log_banner
}

# Event handler: on command execution completion.
on_cmd_end()
{
	log_banner
	deactivate
	log $1" :: ENDS"
	log_banner
}

# Wraps pushd command to suppress stdout.
function pushd () {
    command pushd "$@" > /dev/null
}

# Wraps popd command to suppress stdout.
function popd () {
    command popd "$@" > /dev/null
}

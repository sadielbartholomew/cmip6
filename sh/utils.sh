#!/bin/bash

# ###############################################################
# SECTION: INITIALIZE PATHS / VARS
# ###############################################################

# Vars.
source $ESDOC_HOME/bash/utils_vars.sh

# Vocabs.
source $CMIP6_BASH/utils_vocabs.sh

# Specializations.
source $CMIP6_BASH/utils_specializations.sh

# ###############################################################
# SECTION: HELPER FUNCTIONS
# ###############################################################

# Activates a virtual environment.
activate_venv()
{
	export PYTHONPATH=$CMIP6_HOME:$PYTHONPATH
	source $CMIP6_LIB_VENV/bin/activate
	log "venv activated @ "$CMIP6_LIB_VENV
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

on_cmd_begin()
{
	log_banner
	log $1" :: BEGINS"
	activate_venv
	log_banner
}

on_cmd_end()
{
	log_banner
	deactivate
	log $1" :: ENDS"
	log_banner
}



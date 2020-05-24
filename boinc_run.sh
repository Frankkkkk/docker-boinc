#!/bin/bash

set -x

PROJECT_URL=${BOINC_PROJECT_URL:-www.worldcommunitygrid.org}
PROJECT_KEY=${BOINC_PROJECT_KEY:-364071_b5bdc1307a93c2100d7dbec759c53a70}

MAX_CPUS=${BOINC_MAX_CPUS:-64}
MAX_NCPUS_PCT=${BOINC_MAX_NCPUS_PCT:-90}
CPU_USAGE_LIMIT=${BOINC_CPU_USAGE_LIMIT:-100}

f=global_prefs.xml
if [ -e $f ]; then
	#Beware: this is fucking ugly
	sed -i "/<max_cpus>/c\<max_cpus>$MAX_CPUS<\/max_cpus>" $f
	sed -i "/<max_ncpus_pct>/c\<max_ncpus_pct>$MAX_NCPUS_PCT<\/max_ncpus_pct>" $f
	sed -i "/<cpu_usage_limit>/c\<cpu_usage_limit>$CPU_USAGE_LIMIT<\/cpu_usage_limit>" $f

fi

boinc --no_gui_rpc --attach_project $PROJECT_URL $PROJECT_KEY

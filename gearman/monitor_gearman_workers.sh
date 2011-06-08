#!/bin/bash
#===============================================================================
# Shell Script: monitor_gearman_workers.sh	
#
#
# Purpose: 	monitor gearman workers and return wh3n all workers have stopped 
#		or until a user provided time out is reached
# 
# Usage: 	monitor_gearman_workers.sh  [#]
#		where # is a timeout value in seconds
# Notes:  
#
#
# Author:	Cary Corse	08-06-11
#
# Checked By:	Name		DD-MM-YY
#
# Version:	1.0
#===============================================================================
#
# History of Changes:
#
# 1.1	INI	00-00-00	CHG REF
#-------------------------------------------------------------------------------
#===============================================================================
#	Declare Variables
#-------------------------------------------------------------------------------
GEARMANPID=`cat /var/www/gdgt/app/config/gearmanmanager.pid`
time=0
TIMEOUT=300
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#	Main Processing Starts Here
#-------------------------------------------------------------------------------

#check for user defined timeout
if [[ -n "$1" ]]
then
   TIMEOUT=$1
fi

#value is the wc-l of the ps command, target is 1 due to persistent header output from ps
until [ "$value" = "1" ] || [ "$time" -gt "$TIMEOUT" ]
do
   value=`ps -fo pid --ppid $GEARMANPID 2>/dev/null |wc -l`
   let time=$time+5
   sleep 5
done

exit 0

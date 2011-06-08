#!/usr/bin/ksh
#===============================================================================
#@(#) Unix Shell Script:	init_job_monitor.ksh 
#
#
#@(#) Purpose: Update Job Monitor Log with server init level changes
#@(#)
# 
#@(#) Usage: init_job_monitor.ksh { start | stop }
#
# Notes:  this is an init.d script
#	  It is called by init_job_monitor which is a bourne shell script
#	  and does not handle the functions require by the job monitor
#	  routines.
#      
#@(#) External Functions : xfn_lg_Job_Monitor
#
#@(#) Author:	Cary Corse	13-01-05
#
# Checked By:	Name		DD-MM-YY
#
#@(#) Version:	1.0
#===============================================================================
#
# History of Changes:
#
# 1.1	INI	00-00-00	CHG REF
#-------------------------------------------------------------------------------
#===============================================================================
#	Declare Variables
#-------------------------------------------------------------------------------
FPATH=/opt/local/functions/log
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#	Main Processing Starts Here
#-------------------------------------------------------------------------------
case "$1" in
   'start') xfn_lg_Job_Monitor -t"*** Server services available"
            ;;
    'stop') xfn_lg_Job_Monitor -t"*** Server shutting down"
            ;;
         *) echo "Usage: $0 { start | stop }"
            ;;
esac

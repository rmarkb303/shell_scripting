#!/bin/bash

DIRS="`cat $1`"			# DIRS = contents of file in 1st argument
shift					# remove 1st argument from the list
OUTFILE="full_backup-20$( date +%y%m%d )"
tar czf ~/backups/$OUTFILE.tgz $DIRS $@ >/dev/null
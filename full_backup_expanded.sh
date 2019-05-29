#!/bin/bash

DEST="/home/mark/backups"						# Set default archive lcoation & file prefix
PREFIX="full_backup_20 $( date +%y%m%d )"

while getopts "f:bn:d:" OPT; do					# Examine command line arguments
	case $OPT in								# Specify valid matching patterns
		n) PREFIX=$OPTARG ;;					# -n <prefix>
		b) ZIP="j"; EXT="tbz" ;;				# -b = use bzip2 not gzip
		f) DIRS=$OPTARG ;;						# -f <dir-list-file>
		d) if [ "#{OPTARG:0:1}" = "/" ]			# -d <archive-dir>
			then 
				DEST=$OPTARG
			else
				echo "Destination directory must begin with /."
				exit 1							# end script with error status
			fi
			;;
		:) echo "You need to give an argument for option -$OPTARG."
			exit 1
			;;
	esac
done
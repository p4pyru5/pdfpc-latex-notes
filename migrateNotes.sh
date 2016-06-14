#!/bin/bash

JOBNAME=$1

if [[ -z $JOBNAME ]]; then
	echo "You have to give the name of your pdf-file as argument. Exit."
	exit -1
fi


JOBNAME=${JOBNAME%.*}

NOTES_FILE=$( echo "$JOBNAME.pdfpc.notes" )
PDFPC_FILE=$( echo "$JOBNAME.pdfpc" )

TMP_FILE=".notes.tmp"


# echo "jobname=$JOBNAME"

# echo "notes file=$NOTES_FILE"
# echo "pdfpc file=$PDFPC_FILE"


notes_start_linenr=$( awk '/\[notes\]/{ print NR; exit }'  $PDFPC_FILE )

# echo "[notes] sections starts at line $notes_start_linenr"

lines_pre_notes=$(( $notes_start_linenr - 1 ))


echo -n "" > $TMP_FILE

head --lines=$lines_pre_notes $PDFPC_FILE >> $TMP_FILE

# TODO check if file exists
cat $NOTES_FILE >> $TMP_FILE


# replace \\ with newlines
sed -i 's/\\\\/\n/g' $TMP_FILE
sed -i 's/\\par/\n\n/g' $TMP_FILE



echo "---------------------------------------"
cat $TMP_FILE


cat $TMP_FILE > $PDFPC_FILE



#!/bin/bash

JOBNAME=$1

if [[ -z $JOBNAME ]]; then
	echo "You have to give the name of your pdf-file as argument. Exit."
	exit -1
fi

# name of pdf/pdfpc/tex-file, extension does not matter
JOBNAME=${JOBNAME%.*}

NOTES_FILE=$( echo "$JOBNAME.pdfpc.notes" )
PDFPC_FILE=$( echo "$JOBNAME.pdfpc" )
PDFPC_FILE_BAK=$PDFPC_FILE.bak


if [[ ! -f $NOTES_FILE ]]; then
	echo "There is no notes-file with name: $NOTES_FILE"
	exit 1
fi



# echo "jobname=$JOBNAME"
# echo "notes file=$NOTES_FILE"
# echo "pdfpc file=$PDFPC_FILE"


# create Backup-file of pdfpc
cp -f $PDFPC_FILE $PDFPC_FILE_BAK



notes_start_linenr=$( awk '/\[notes\]/{ print NR; exit }'  $PDFPC_FILE_BAK )
# echo "[notes] sections starts at line $notes_start_linenr"
lines_pre_notes=$(( $notes_start_linenr - 1 ))

# truncate pdfpc file
echo -n "" > $PDFPC_FILE
# copy all non-note-lines from original pdfpc file to tmp file
head --lines=$lines_pre_notes $PDFPC_FILE_BAK >> $PDFPC_FILE

# TODO check if file exists
# replace \\ with newlines
sed -i 's/\\\\/\n/g' $NOTES_FILE
sed -i 's/\\par/\n\n/g' $NOTES_FILE
# copy notes to pdfpc file
cat $NOTES_FILE >> $PDFPC_FILE

# Show new content
echo "---------------------------------------"
cat $PDFPC_FILE









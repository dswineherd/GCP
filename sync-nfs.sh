#!/bin/bash

# SYNC CONFIGURATION
SYNC_ORIGIN_PATH="Your Local Origin Path"
SYNC_DESTINATION_PATH=Bucket_Destination
STATUS_FILE=Path to write status file

printf 'Synchonizing to bucket - %(%Y-%m-%d %T)T\n'

if /usr/bin/gsutil -m rsync -r -P -x '.nfs*' $SYNC_ORIGIN_PATH $SYNC_DESTINATION_PATH; then
  printf 'OK %(%Y-%m-%d %T)T' > $STATUS_FILE
  printf 'Sync finished OK - %(%Y-%m-%d %T)T\n'
else
  printf 'KO %(%Y-%m-%d %T)T' > $STATUS_FILE
  printf '[ERROR] Sync finished with ERRORS - %(%Y-%m-%d %T)T\n'
  exit 1;
fi

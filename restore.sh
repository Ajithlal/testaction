#!/bin/bash

# PostgreSQL Database Details
PGHOST="my-drupal.cejaq96ptmdo.us-east-1.rds.amazonaws.com"
PGPORT="5432"
PGUSER="postgres"
PGPASSWORD="$PGPASSWORD"
DATABASE_NAME="drupal"

# AWS S3 Details
S3_BUCKET="ajithlal-test-bucket"
S3_PREFIX="backup/"

# Specify the backup file to restore
BACKUP_FILE="backup-file-name.sql"  # Replace with the actual backup file name

# Download the backup from AWS S3
aws s3 cp s3://$S3_BUCKET/$S3_PREFIX$BACKUP_FILE $BACKUP_FILE

# Restore the database from the backup file
PGPASSWORD="$PGPASSWORD" pg_restore -h $PGHOST -p $PGPORT -U $PGUSER -d $DATABASE_NAME -c $BACKUP_FILE

# Remove the downloaded backup file
rm $BACKUP_FILE
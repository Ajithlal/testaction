#!/bin/bash

# PostgreSQL Database Details
PGHOST="drupal-prod.cv68spreavdv.us-east-1.rds.amazonaws.com"
PGPORT="5432"
PGUSER="postgres"
PGPASSWORD="$PGPASSWORD"
DATABASE_NAME="drupal"

# AWS S3 Details
S3_BUCKET="ajithlal-test-bucket"
S3_PREFIX="backup/"

# Timestamp for the backup file
BACKUP_FILE="backup-file-name.sql"

# Create a PostgreSQL backup
PGPASSWORD="$PGPASSWORD" pg_dump -h $PGHOST -p $PGPORT -U $PGUSER -d $DATABASE_NAME --format=custom > $BACKUP_FILE

# Upload the backup to AWS S3
aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/$S3_PREFIX$BACKUP_FILE

# Remove the local backup file
rm $BACKUP_FILE
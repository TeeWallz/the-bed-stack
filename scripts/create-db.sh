#!/bin/bash

# Source .env file to get environment variables
source .env

# Run wait-for-it.sh with the sourced environment variables
./wait-for-it.sh db:5432 -- strict --timeout=60 -- psql -h db -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c 'SELECT 1;' && bun db:migrate && bun db:seed

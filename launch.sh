#!/bin/bash

cd /genenotebook

ROOT_URL="${ROOT_URL:-http://localhost}"

if [[ $RUN_MODE == "dev" ]]
then

  npm run dev

else

  if [[ ! -z "$MONGO_URL" ]]
  then
    ./genenotebook_*/genenotebook run --mongo-url $MONGO_URL --root-url $ROOT_URL
  elif [[ ! -z "$DB_PATH" ]]
    ./genenotebook_*/genenotebook run --db-path $DB_PATH --root-url $ROOT_URL
  else
    ./genenotebook_*/genenotebook run --root-url $ROOT_URL
fi

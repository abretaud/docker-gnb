#!/bin/bash

cd /genenotebook

if [[ $RUN_MODE == "dev" ]]
then

  npm run dev

else

  ./genenotebook_*/genenotebook run --mongo-url $MONGO_URL
fi

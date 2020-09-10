#!/bin/bash

cd /genenotebook

if [[ $RUN_MODE == "dev" ]]
then

  npm run dev

else

  cd /genenotebook/genenotebook_${GNB_VERSION_DIR}
  ./genenotebook run --mongo-url $MONGO_URL
fi

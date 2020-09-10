# Docker Image for genenotebook

A Docker image for (genenotebook)[https://github.com/genenotebook/genenotebook], alternative to https://github.com/genenotebook/genenotebook_docker

Reasons to make this alternative image:
 - do not depend on the conda package (which is not up to date currently)
 - ease development
 - testing things

## Configuration

Env vars:

```
MONGO_URL: "mongodb://mongodb:27017/genenotebook"
NODE_OPTIONS: "--max-old-space-size=8192"
RUN_MODE: "prod" # or "dev"
```

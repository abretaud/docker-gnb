# Docker Image for genenotebook

A Docker image for [genenotebook](https://github.com/genenotebook/genenotebook), alternative to https://github.com/genenotebook/genenotebook_docker

Reasons to make this alternative image:
 - do not depend on the conda package (which is not up to date currently)
 - ease development
 - testing things

## Configuration

Env vars:

```
MONGO_URL: "mongodb://mongodb:27017/genenotebook"
DB_PATH: "/data/db" (mutually exclusive with MONGO_URL
ROOT_URL: Default to "http://localhost"
NODE_OPTIONS: "--max-old-space-size=8192"
RUN_MODE: "prod" # or "dev"

```

## Building

The image is not yet on quay.io, to build it locally run this:

```
docker build -t quay.io/abretaud/genenotebook:master .
```

## Default accounts

Default user accounts are created on first startup. They can be configured by creating a settings.json file and mounting it in the container.

The default settings.json is like that:


```
{
    "accounts": [
        {
            "username": "admin",
            "email": "admin@admin.com",
            "password": "admin",
            "profile": {
                "first_name": "admin",
                "last_name": "admin"
            },
            "role": "admin"
        },
        {
            "username": "guest",
            "email": "guest@guest.com",
            "password": "guest",
            "profile": {
                "first_name": "guest",
                "last_name": "guest"
            },
            "role": "registered"
        }
    ]
}
```

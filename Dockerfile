FROM node:14-buster-slim

MAINTAINER Anthony Bretaudeau <anthony.bretaudeau@inrae.fr>

EXPOSE 3000

ENV METEOR_VERSION=2.4
ENV LC_ALL=POSIX
ENV METEOR_ALLOW_SUPERUSER=1

RUN apt-get -yq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        curl \
        gnupg \
        g++ \
        make \
        git \
        python3 \
        jq \
        nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl "https://install.meteor.com/?release=${METEOR_VERSION}" | /bin/sh

ENV PATH=$PATH:/root/.meteor

#ENV GNB_VERSION v0.3.0
ENV GNB_VERSION master

RUN mkdir /genenotebook && \
    curl -L https://github.com/genenotebook/genenotebook/archive/${GNB_VERSION}.tar.gz | \
	tar xzf - --strip-components=1 -C /genenotebook

COPY settings.json /genenotebook/

WORKDIR /genenotebook

# TODO add tail to package.json upstream
RUN npm install --unsafe-perm \
    && npm install tail

RUN METEOR_ALLOW_SUPERUSER=1 METEOR_DISABLE_OPTIMISTIC_CACHING=1 npm run bundle

COPY launch.sh /launch.sh
ENV RUN_MODE=prod

CMD ["/launch.sh"]

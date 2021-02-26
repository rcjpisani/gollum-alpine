FROM ruby:2-alpine

MAINTAINER Robert Pisani <rcjpisani@protonmail.com>

RUN apk add --no-cache --virtual .build \
		build-base \
		cmake \
		icu-dev \
		openssl-dev \
	&& apk add --no-cache git \
&& ln -s /usr/bin/make /usr/bin/gmake \
&& gem install gollum github-markdown \
&& apk del .build

WORKDIR /srv/wiki

ENTRYPOINT ["/usr/local/bundle/bin/gollum", "--port", "80"]

EXPOSE 80

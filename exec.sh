#!/usr/bin/env bash
docker build -t auth0-publish-rubygem .
docker run -it auth0-publish-rubygem

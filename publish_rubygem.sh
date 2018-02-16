#!/usr/bin/env bash

# Create directory for rubygems credentials
mkdir /root/.gem
# Get API key from rubygems.org
curl -u "$RUBYGEMS_EMAIL":"$RUBYGEMS_PASSWORD" https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
# Build Gem
gem build auth0.gemspec
# Publish Gem
gem push auth0-*.gem

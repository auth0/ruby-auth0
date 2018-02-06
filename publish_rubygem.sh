#!/usr/bin/env bash

# Create file with credentials for rubygems.org
touch credentials.txt
echo $RUBYGEMS_EMAIL > credentials.txt
echo $RUBYGEMS_PASSWORD >> credentials.txt
# build the gem
gem build auth0.gemspec
# publish the gem on rubygems.org
gem push auth0-*.gem < credentials.txt
# Delete credentials file
rm credentials.txt

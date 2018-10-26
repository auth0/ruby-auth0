#!/bin/bash

if [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then 
  bundle exec rake all
else 
  bundle exec rake spec
fi
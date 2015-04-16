#!/bin/bash

if [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then 
  MODE=full bundle exec rake all
else 
  bundle exec rake spec
fi
# Publish the Gem on RubyGems.org

To publish the gem set `RUBYGEMS_EMAIL` and `RUBYGEMS_PASSWORD` environment variables with your email and password from your RubyGems account respectively.
Then run the following [Docker](https://docs.docker.com/engine/installation/) commands in the terminal to build and publish the gem.

```bash
docker build -t auth0-publish-rubygem .
docker run --rm -e RUBYGEMS_EMAIL="$RUBYGEMS_EMAIL" -e RUBYGEMS_PASSWORD="$RUBYGEMS_PASSWORD" -it auth0-publish-rubygem /bin/sh publish_rubygem.sh
```

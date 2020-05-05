# Releasing the gem

## Credentials set up

Make sure you have access in https://rubygems.org/gems/auth0/ and that your Ruby Gems tokens are set in `~/.gem/credentials`.

In order to generate the required changelog entry, define an environment variable `GITHUB_READ_TOKEN` with a Github API token that has READ access to `repo:public_repo`. You can generate a Github API Token [here](https://github.com/settings/tokens/new?description=GitHub%20Changelog%20Generator%20token).

Create a new Github Milestone with the version name prefixed with `v`. i.e. `v4.10.2`. Assign every Issue and Pull Request to be included on this release to that Milestone, and tag them with the `CH:xxxxxx` labels, depending on the type of change fixed or introduced there.

Finally, follow the next steps:

```bash
# Install gems for exec commands
bundle install

# Run all tests
bundle exec rake test

# Create a release branch
git checkout master
git pull
git checkout -b release-X.X.X
git push --set-upstream origin release-X.X.X

# Update the version number
# This will create a commit with the new version
bundle exec gem bump --version X.X.X

# Make sure the Gemfile.lock is up-to-date
bundle update
git commit -am "Update gems"

# Generate the changelog
github_changelog_generator -t $GITHUB_READ_TOKEN
# ... or similar.
# Review the changelog
# Remove "unreleased" section
# Make sure the tags are ordered

# Commit, push, and create a PR for this release
git commit -am "Update CHANGELOG.md"
git push

# Add related milestone
# Create PR on GitHub and assign for review
# Merge/rebase and delete branch once approved

# Create and add a tag
git checkout master
git pull
bundle exec gem tag
git push origin vX.X.X
# Create a new release from this tag on GitHub using markdown from the changelog

# Make sure you are an author for this gem here https://rubygems.org/gems/auth0/
# Rubygems token can be updated in ~/.gem/credentials
bundle exec gem release
```

The steps above were tested with Ruby `v2.5.7`.

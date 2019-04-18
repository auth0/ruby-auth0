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

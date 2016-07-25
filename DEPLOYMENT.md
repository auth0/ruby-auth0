```
bundle install
bundle exec rake spec
bundle exec gem bump --version x.y.z
bundle exec gem tag
github_changelog_generator -t <YOUR TOKEN>
bundle exec gem release
```

> Note for the changelog:
  * Review the changelog.
  * Remove "unreleased" section.
  * Make sure the tags are ordered.
  * Commit / push the changelog to master.

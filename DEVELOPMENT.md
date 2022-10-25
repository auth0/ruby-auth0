# Development

In order to set up the local environment you'd have to have Ruby installed and a few global gems used to run and record the unit tests. A working Ruby version can be taken from the [CI script](/.circleci/config.yml). At the moment of this writting we're using Ruby `2.5.7`.

> It is expected that every Pull Request introducing a fix, change or feature contains enough test coverage to assert the new behavior.

## Running the tests

Install the gems required for this project.

```bash
bundle install
```

Finally, run the tests.

```bash
bundle exec rake test
```

### Running only unit tests

You can run only the unit tests and ignore the integration tests by running the following:

```bash
bundle exec rake spec
```

### Running only integration tests

You can run only the unit tests and ignore the integration tests by running the following:

```bash
bundle exec rake integration
```

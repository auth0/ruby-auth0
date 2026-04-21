# frozen_string_literal: true

# Custom gemspec configuration file
# This file is automatically loaded by the main gemspec file. The 'spec' variable is available
# in this context from the main gemspec file. You can modify this file to add custom metadata,
# dependencies, or other gemspec configurations. If you do make changes to this file, you will
# need to add it to the .fernignore file to prevent your changes from being overwritten.

def add_custom_gemspec_data(spec)
  spec.add_dependency "rest-client", "~> 2.1"
  spec.add_dependency "jwt", "~> 2.7"
  spec.add_dependency "zache", "~> 0.12"
  spec.add_dependency "addressable", "~> 2.8"
  spec.add_dependency "retryable", "~> 3.0"
end

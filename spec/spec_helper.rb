require 'dotenv'

Dotenv.load

mode = ENV['MODE'] || 'unit'

$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'rack/test'
require 'faker'
require 'auth0'

Dir['./lib/**/*.rb'].each { |f| require f }
Dir['./spec/support/**/*.rb'].each { |f| require f }
Dir['./spec/support/*.rb'].each { |f| require f }

def entity_suffix
  (ENV['TRAVIS_JOB_ID'] || ENV['TEST_ENTITY_SUFFIX'] || 'rubytest').delete('_')
end

puts "Entity suffix is #{entity_suffix}"

require_relative "spec_helper_#{mode}"

guard 'rspec', cmd: 'rspec --drb --format Fuubar --color' do
  # run every updated spec file
  watch(%r{^spec/.+_spec\.rb$})
  # run the lib specs when a file in lib/ changes
  watch(%r{^lib/(.+)\.rb$}) { "spec" }
  # run all test for helper changes
  watch('spec/spec_helper.rb')  { "spec" }
end
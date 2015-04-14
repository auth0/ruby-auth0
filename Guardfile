scope group: :unit_test

group :unit_test do
  guard 'rspec', cmd: "bundle exec rspec -P \"spec/lib/auth0/**/*#{ENV['PATTERN']}*_spec.rb\" --drb --format Fuubar --color" do
    # run every updated spec file
    watch(%r{^spec/.+_spec\.rb$})
    # run the lib specs when a file in lib/ changes
    watch(%r{^lib/(.+)\.rb$}) { "spec" }
    # run all test for helper changes
    watch('spec/spec_helper.rb')  { "spec" }
  end
end

group :integration do
  guard 'rspec', cmd: "MODE=full bundle exec rspec -P \"spec/integration/**/*#{ENV['PATTERN']}*_spec.rb\" --drb --format Fuubar --color" do
    # run every updated spec file
    watch(%r{^spec/.+_spec\.rb$})
    # run the lib specs when a file in lib/ changes
    watch(%r{^lib/(.+)\.rb$}) { "spec" }
    # run all test for helper changes
    watch('spec/spec_helper.rb')  { "spec" }
  end
end

group :full do
  guard 'rspec', cmd: "MODE=full bundle exec rspec --drb --format Fuubar --color" do
    # run every updated spec file
    watch(%r{^spec/.+_spec\.rb$})
    # run the lib specs when a file in lib/ changes
    watch(%r{^lib/(.+)\.rb$}) { "spec" }
    # run all test for helper changes
    watch('spec/spec_helper.rb')  { "spec" }
  end
end
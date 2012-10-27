group :integration do
  guard 'rspec', :version => 2, spec_paths: ["spec/integration"] do
    watch('Gemfile') { "spec/integration" }
    watch('Gemfile.lock') { "spec/integration" }
    watch('mingo.gemspec') { "spec/integration" }
    watch(%r{^spec/integration/.+_spec\.rb$}) { "spec/integration" }
    watch(%r{^lib/(.+)\.rb$}) { "spec/integration" }
    watch(%r{^lib/mingo/(.+)\.rb$}) { "spec/integration" }
  end
end

group :units do
  guard 'rspec', :all_after_pass => false, :version => 2, spec_paths: ["spec/units/mingo"] do
    watch('Gemfile') { "spec/units" }
    watch('Gemfile.lock') { "spec/units" }
    watch('mingo.gemspec') { "spec/units" }
    watch(%r{^spec/units/mingo/.+_spec\.rb$})
    watch(%r{^lib/mingo/(.+)\.rb})            { |m| "spec/units/mingo/#{m[1]}_spec.rb" }
  end
end

require "rake"
require "rspec/core/rake_task"
require "yaml"

# My tasks ----------------
# RSpec::Core::RakeTask.new(:run_core_tests) => [:count_schools, :count_titles] do |t|
#   puts "Running Core Tests"
# end

# task :default => :run_core_tests

RSpec::Core::RakeTask.new(:temp) do |t|
  t.pattern = "spec/y_spec.rb"
  t.verbose = false
end



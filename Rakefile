require 'rake'
require 'hanami/rake_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'spec'
  t.warning = false
end

RuboCop::RakeTask.new

task default: [:rubocop, :test]
task spec: :test

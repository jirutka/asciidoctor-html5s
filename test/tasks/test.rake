require 'rake/testtask'

namespace :test do

  Rake::TestTask.new :templates do |task|
    task.description = "Run tests for templates"
    task.pattern = "test/templates_test.rb"
    task.libs << 'test'
  end

  task :all   => ['templates']
end

task :test => 'test:all'

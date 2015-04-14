#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/clean'
require 'rake/testtask'

namespace :doctest do
  Rake::TestTask.new :test do |task|
    task.description = "Run tests for templates"
    task.pattern = "test/templates_test.rb"
    task.libs << 'test'
  end
end

begin
  require 'asciidoctor/doctest'
  require 'thread_safe'
  require 'tilt'

  namespace :doctest do
    DocTest::GeneratorTask.new(:generate) do |task|
      task.output_suite = DocTest::HTML::ExamplesSuite.new(
        examples_path: 'test/examples/html5'
      )
      task.converter_opts[:template_dirs] = 'data/templates'
      task.examples_path.unshift 'test/examples/asciidoc-html'
    end
  end
rescue LoadError => e
  warn "#{e.path} is not available"
end

task :test => 'doctest:test'
task :default => :test

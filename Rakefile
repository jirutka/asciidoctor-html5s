#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/clean'

begin
  require 'asciidoctor/doctest'
  require 'thread_safe'
  require 'tilt'

  DocTest::RakeTasks.new(:doctest) do |t|
    t.output_examples :html, path: 'test/examples/html5'
    t.input_examples :asciidoc, path: [
      *DocTest.examples_path,
      'test/examples/asciidoc-html'
    ]
    t.converter = DocTest::HTML::Converter
    t.converter_opts = { template_dirs: 'data/templates' }
  end

  task :test => 'doctest:test'
  task :default => :test

rescue LoadError => e
  warn "#{e.path} is not available"
end

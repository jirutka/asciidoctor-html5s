#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/clean'

CONVERTER_FILE = 'lib/asciidoctor/html5s/converter.rb'
TEMPLATES_DIR = 'data/templates'

namespace :build do

  file CONVERTER_FILE, [:mode] => FileList["#{TEMPLATES_DIR}/*"] do |t, args|
    require 'asciidoctor-templates-compiler'

    File.open(CONVERTER_FILE, 'w') do |file|
      $stderr.puts "Generating #{file.path}."
      Asciidoctor::TemplatesCompiler::Slim.compile_converter(
          templates_dir: 'data/templates',
          class_name: 'Asciidoctor::Html5s::Converter',
          register_for: ['html5s'],
          backend_info: {
            basebackend: 'html',
            outfilesuffix: '.html',
            filetype: 'html',
          },
          pretty: (args[:mode] == :pretty),
          output: file)
    end
  end

  namespace :converter do
    desc 'Compile Slim templates and generate converter.rb (pretty mode)'
    task :pretty do
      Rake::Task[CONVERTER_FILE].invoke(:pretty)
    end

    desc 'Compile Slim templates and generate converter.rb (fast mode)'
    task :fast do
      Rake::Task[CONVERTER_FILE].invoke
    end
  end

  task :converter => 'converter:pretty'
end

task :build => 'build:converter:pretty'

task :clean do
  rm_rf CONVERTER_FILE
  rm_rf Dir['*.gem']
  rm_rf Dir['pkg/*.gem']
end

begin
  require 'asciidoctor/doctest'

  DocTest::RakeTasks.new(:doctest) do |t|
    t.output_examples :html, path: 'test/examples/html5'
    t.input_examples :asciidoc, path: [
      *DocTest.examples_path,
      'test/examples/asciidoc-html'
    ]
    t.converter = DocTest::HTML::Converter
    t.converter_opts = { backend_name: 'html5s' }
  end

  task 'prepare-converter' do
    # Run as an external process to ensure that it will not affect tests
    # environment with extra loaded modules (especially slim).
    `bundle exec rake build:converter:fast`

    require_relative 'lib/asciidoctor-html5s'
  end

  task 'doctest:test' => 'prepare-converter'
  task 'doctest:generate' => 'prepare-converter'
  task :test => 'doctest:test'
  task :default => :test

rescue LoadError => e
  warn "#{e.path} is not available"
end

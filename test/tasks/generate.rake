require 'asciidoctor/doctest'
require 'thread_safe'
require 'tilt'

DocTest::GeneratorTask.new(:generate) do |task|
  task.output_suite = DocTest::HTML::ExamplesSuite.new(
    examples_path: 'test/examples/html5'
  )
  task.converter_opts[:template_dirs] = 'data/templates'
  task.examples_path.unshift 'test/examples/asciidoc-html'
end

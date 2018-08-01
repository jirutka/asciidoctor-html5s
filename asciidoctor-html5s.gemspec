# coding: utf-8
require File.expand_path('lib/asciidoctor/html5s/version', __dir__)

Gem::Specification.new do |s|
  s.name          = 'asciidoctor-html5s'
  s.version       = Asciidoctor::Html5s::VERSION
  s.author        = 'Jakub Jirutka'
  s.email         = 'jakub@jirutka.cz'
  s.homepage      = 'https://github.com/jirutka/asciidoctor-html5s'
  s.license       = 'MIT'

  s.summary       = 'Semantic HTML5 backend (converter) for Asciidoctor'
  s.description   = <<-EOF
#{s.summary}

This converter focuses on correct semantics, accessibility and compatibility
with common typographic CSS styles.
EOF

  s.files         = Dir['data/**/*', 'lib/**/*', '*.gemspec', 'LICENSE*', 'README*']

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'asciidoctor', '~> 1.5.7'
  s.add_runtime_dependency 'thread_safe', '~> 0.3.4'

  s.add_development_dependency 'asciidoctor-doctest', '= 2.0.0.beta.4'
  s.add_development_dependency 'asciidoctor-templates-compiler', '~> 0.4.0'
  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'coderay', '~> 1.1'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'slim', '~> 3.0'
  s.add_development_dependency 'slim-htag', '~> 0.1.0'
end

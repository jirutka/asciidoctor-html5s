# coding: utf-8
require File.expand_path('lib/asciidoctor/html5s/version', __dir__)

Gem::Specification.new do |s|
  s.name          = 'asciidoctor-html5s'
  s.version       = Asciidoctor::Html5s::VERSION
  s.author        = 'Jakub Jirutka'
  s.email         = 'jakub@jirutka.cz'
  s.homepage      = 'https://github.com/jirutka/asciidoctor-html5s'
  s.license       = 'MIT'

  s.summary       = 'Semantic HTML5 converter (backend) for Asciidoctor'
  #s.description   = 'TODO'

  s.files         = Dir['data/**/*', 'lib/**/*', '*.gemspec', 'LICENSE*', 'README*']
  s.has_rdoc      = false

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'asciidoctor', '~> 1.5.5'
  s.add_runtime_dependency 'thread_safe', '~> 0.3.4'

  s.add_development_dependency 'asciidoctor-doctest', '= 2.0.0.beta.3'
  s.add_development_dependency 'asciidoctor-templates-compiler', '~> 0.1.2'
  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'coderay', '~> 1.1'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'slim', '~> 3.0'
  s.add_development_dependency 'slim-htag', '~> 0.1.0'
end

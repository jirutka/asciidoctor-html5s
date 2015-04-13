# coding: utf-8

Gem::Specification.new do |s|
  s.name          = 'asciidoctor-html5'
  s.version       = '1.0.0.dev'
  s.author        = 'Jakub Jirutka'
  s.email         = 'jakub@jirutka.cz'
  s.homepage      = 'https://github.com/jirutka/asciidoctor-html5'
  s.license       = 'MIT'

  s.summary       = 'Semantic HTML5 backend'
  #s.description   = 'TODO'

  begin
    s.files       = `git ls-files -z -- */* {LICENSE,Rakefile,README}*`.split("\x0")
  rescue
    s.files       = Dir['**/*']
  end
  s.test_files    = s.files.grep(/^test\//)
  s.has_rdoc      = false

  s.required_ruby_version = '>= 2.0'

  s.add_runtime_dependency 'asciidoctor', '1.5.2'
  s.add_runtime_dependency 'slim', '~> 2.1'
  s.add_runtime_dependency 'thread_safe', '~> 0.3.4'

  s.add_development_dependency 'asciidoctor-doctest', '~> 1.5.1.2'
  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'coderay', '~> 1.1'
  s.add_development_dependency 'pygments.rb', '~> 0.6'
  s.add_development_dependency 'rake', '~> 10.0'
end

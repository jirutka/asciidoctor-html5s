source 'https://rubygems.org'
gemspec

unless ENV.fetch('ASCIIDOCTOR_VERSION', '').empty?
  if (match = ENV['ASCIIDOCTOR_VERSION'].match(/^git:(\w+)/))
    gem 'asciidoctor', github: 'asciidoctor/asciidoctor', ref: match[1]
  else
    gem 'asciidoctor', ENV['ASCIIDOCTOR_VERSION']
  end
end

group :development do
  # Keep in sync with version used for asciidoctor.js.
  gem 'opal', '~> 0.11.0'
end

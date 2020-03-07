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
  # Keep in sync with version used in opal-node-runtime <- asciidoctor.js.
  # TODO: Maybe replace with JS version after
  #   https://github.com/Mogztter/opal-node-compiler/issues/6 is resolved.
  gem 'opal', github: 'opal/opal', ref: '31d26d69'
end

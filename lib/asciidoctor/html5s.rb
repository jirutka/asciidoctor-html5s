require 'asciidoctor' unless RUBY_PLATFORM == 'opal'
require 'asciidoctor/extensions' unless RUBY_PLATFORM == 'opal'
require 'asciidoctor/html5s/version'
require 'asciidoctor/html5s/converter'
require 'asciidoctor/html5s/attached_colist_treeprocessor'

if defined? Asciidoctor::STEM_TYPE_ALIASES
  # Change default stem type to latexmath.
  # Asciidoctor's default is asciimath which is not supported by KaTeX.
  Asciidoctor::STEM_TYPE_ALIASES.tap do |hash|
    hash['asciimath'] = 'asciimath'
    hash.default = 'latexmath'
  end
end

Asciidoctor::Extensions.register do
  treeprocessor Asciidoctor::Html5s::AttachedColistTreeprocessor
end

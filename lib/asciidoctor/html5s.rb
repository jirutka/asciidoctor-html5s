require 'asciidoctor/extensions' unless RUBY_PLATFORM == 'opal'
require 'asciidoctor/html5s/version'
require 'asciidoctor/html5s/converter'
require 'asciidoctor/html5s/attached_colist_treeprocessor'

Asciidoctor::Extensions.register do
  treeprocessor Asciidoctor::Html5s::AttachedColistTreeprocessor
end

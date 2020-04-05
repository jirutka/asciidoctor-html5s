require 'asciidoctor/html5s/version'
require 'asciidoctor/html5s/converter'
require 'asciidoctor/html5s/replacements'
require 'asciidoctor/html5s/attached_colist_treeprocessor'

if defined? Asciidoctor::SyntaxHighlighter
  require 'asciidoctor/html5s/html_pipeline_highlighter'
end

unless RUBY_PLATFORM == 'opal'
  require 'asciidoctor/extensions'

  Asciidoctor::Extensions.register do
    treeprocessor Asciidoctor::Html5s::AttachedColistTreeprocessor
  end
end

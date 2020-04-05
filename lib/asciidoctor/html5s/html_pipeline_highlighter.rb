# frozen_string_literal: true

module Asciidoctor::Html5s

  # Modification of Asciidoctor::SyntaxHighlighter::HtmlPipelineAdapter that
  # uses attribute `data-lang` instead of `lang`.
  #
  # Rationale: Attribute `lang` is defined for natural language of text, not
  # for programming languages.
  class HtmlPipelineHighlighter < ::Asciidoctor::SyntaxHighlighter::Base
    register_for 'html-pipeline'

    def format(node, lang, opts)
      %(<pre><code#{%{ data-lang="#{lang}"} if lang}>#{node.content}</code></pre>)
    end
  end
end

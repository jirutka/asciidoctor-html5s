# frozen_string_literal: true

module Asciidoctor::Html5s

  # Modification of Asciidoctor::SyntaxHighlighter::HtmlPipelineAdapter that
  # uses attribute `data-lang` instead of `lang`.
  #
  # Rationale: Attribute `lang` is defined for natural language of text, not
  # for programming languages.
  class HtmlPipelineHighlighter < ::Asciidoctor::SyntaxHighlighter::Base
    register_for 'html-pipeline'

    def initialize(name, backend, opts = {})
      super
      # Use this version of the #format method only for our backend, otherwise
      # use the original variant.
      singleton_class.send(:alias_method, :format, :format_orig) if backend != 'html5s'
    end

    def format(node, lang, _opts)
      %(<pre><code#{%{ data-lang="#{lang}"} if lang}>#{node.content}</code></pre>)
    end

    # Copied from Asciidoctor::SyntaxHighlighter::HtmlPipelineAdapter#format.
    # Note: HtmlPipelineAdapter is not available in asciidoctor.js, that's why
    # it's done like this instead of delegation or inheritance.
    def format_orig(node, lang, _opts)
      %(<pre#{%{ lang="#{lang}"} if lang}><code>#{node.content}</code></pre>)
    end
  end
end

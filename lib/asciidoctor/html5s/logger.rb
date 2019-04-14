# frozen_string_literal: true
require 'logger' unless RUBY_PLATFORM == 'opal'
require 'asciidoctor' unless RUBY_PLATFORM == 'opal'
require 'asciidoctor/html5s/version'

module Asciidoctor::Html5s
  # Helper module for getting default Logger based on the Asciidoctor version.
  module Logging
    module_function

    # @return [Logger] the default `Asciidoctor::Logger` if using Asciidoctor
    #   1.5.7 or later, or Ruby's `Logger` that outputs to `STDERR`.
    def default_logger
      if defined? ::Asciidoctor::LoggerManager
        ::Asciidoctor::LoggerManager.logger
      else
        ::Logger.new(STDERR)
      end
    end
  end
end

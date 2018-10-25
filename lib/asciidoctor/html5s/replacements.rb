require 'asciidoctor' unless RUBY_PLATFORM == 'opal'

module Asciidoctor
  # XXX: Regexps escaping is kinda broken in Opal 0.11.x. This is a hack how to
  # make the third regexp work both in Ruby and Opal.
  _BACKSLASH = '\\\\'

  # XXX: Modifies constant defined in Asciidoctor.
  REPLACEMENTS.unshift(
    # foo --- bar -> &thinsp;&mdash;&thinsp;
    [/(^|\n| )---( |\n|$)/, '&#8201;&#8212;&#8201;', :none],
    # foo---bar -> &mdash;{ZERO WIDTH SPACE}
    [/(#{CG_WORD})---(?=#{CG_WORD})/, '&#8212;&#8203;', :leading],

    # foo -- bar -> &thinksp;&ndash;&thinsp;
    # Note: The regexp is copied from Asciidoctor.
    [/(^|\n|#{_BACKSLASH}| )--( |\n|$)/, '&#8201;&#8211;&#8201;', :none],
    # foo--bar -> &ndash;
    # Note: The regexp is copied from Asciidoctor.
    [/(#{CG_WORD})\\?--(?=#{CG_WORD})/, '&#8211;', :leading],
  )
end
